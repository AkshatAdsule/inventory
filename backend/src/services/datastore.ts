import { Datastore } from "@google-cloud/datastore";
import { User, Inventory, Item, Household, Invitation } from "../models/types";

export class DataStoreService {
	private datastore: Datastore;
	private static _instance?: DataStoreService;

	private constructor() {
		this.datastore = new Datastore();
	}

	public static get instance(): DataStoreService {
		if (!this._instance) {
			this._instance = new DataStoreService();
		}

		return this._instance;
	}

	private static set instance(s: DataStoreService) {
		this._instance = s;
	}

	public async getUsers(): Promise<User[]> {
		const query = this.datastore.createQuery("User");
		const [users] = await this.datastore.runQuery(query);
		return users as User[];
	}

	public async getUser(uid: string): Promise<User> {
		const key = this.datastore.key(["User", uid]);
		const [user]: User[] = await this.datastore.get(key);
		if (!user) {
			throw new Error("User not found");
		}
		return user;
	}

	public async createUser(user: User): Promise<void> {
		const userKey = this.datastore.key(["User", user.uid]);

		const userInventory = await this.createInventory();
		user.inventory = userInventory;

		const newUser = {
			key: userKey,
			data: user,
		};

		try {
			await this.datastore.save(newUser);
		} catch (e) {
			throw new Error("could not create user");
		}
	}

	public async createInventory(): Promise<string> {
		const newInventory: Inventory = { items: [] };

		const inventoryKey = this.datastore.key("Inventory");
		await this.datastore.save({
			key: inventoryKey,
			data: newInventory,
		});

		return inventoryKey.id!;
	}
	public async createHousehold(household: Household): Promise<void> {
		const inventory_id = await this.createInventory();
		household.inventory = inventory_id;
		const householdKey = this.datastore.key("Household");
		await this.datastore.save({
			key: householdKey,
			data: household,
		});
	}

	public async getInventory(id: string): Promise<Inventory> {
		const key = this.datastore.key(["Inventory", this.datastore.int(id)]);
		const [inventory] = await this.datastore.get(key);
		if (!inventory) {
			throw Error("inventory not found");
		}
		return inventory as Inventory;
	}

	public async setInventoryItems(id: string, items: Item[]): Promise<void> {
		const inventory = await this.getInventory(id);
		inventory.items = items;
		await this.datastore.save({
			key: this.datastore.key(["Inventory", this.datastore.int(id)]),
			data: inventory,
		});
	}

	public async getHousehold(id: string): Promise<Household> {
		const key = this.datastore.key(["Household", this.datastore.int(id)]);
		const [household] = await this.datastore.get(key);
		if (!household) {
			throw Error("Household not found");
		}
		return household as Household;
	}

	public async createInvitation(invitation: Invitation): Promise<string> {
		const key = this.datastore.key("Invitation");
		this.datastore.save({
			key: key,
			data: invitation,
		});

		const reciever = await this.getUser(invitation.reciever);
		reciever.invitations.push(key.id!);

		const household = await this.getHousehold(invitation.household);
		household.outgoingInvitations.push(key.id!);

		await Promise.all([
			this.setUser(reciever),
			this.setHousehold(invitation.household, household),
		]);

		return key.id!;
	}

	private async setUser(user: User): Promise<void> {
		const key = this.datastore.key(["User", user.uid]);
		console.log(user);
		await this.datastore.save({
			key: key,
			data: user,
		});
	}

	private async setHousehold(id: string, data: Household): Promise<void> {
		const key = this.datastore.key(["Household", this.datastore.int(id)]);
		console.log(data);
		await this.datastore.save({
			key: key,
			data: data,
		});
	}
}
