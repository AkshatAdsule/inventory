import { Item } from "../models/types";
import { DataStoreService } from "../services/datastore";
import { Route } from "./route";

export const getInventory: Route = {
	route: "/inventory/:id",
	method: "get",
	handler: async (req, res) => {
		const id = req.params.id;
		const inventory = await DataStoreService.instance.getInventory(id);
		res.json(inventory).send();
	},
};

export const setInventoryItems: Route = {
	route: "/inventory/:id/items",
	method: "put",
	handler: async (req, res) => {
		const id = req.params.id;
		const items: Item[] = req.body;
		await DataStoreService.instance.setInventoryItems(id, items);
		res.status(200).send();
	},
};

export const addInventoryItems: Route = {
	route: "/inventory/:id/add-items",
	method: "put",
	handler: async (req, res) => {
		const id = req.params.id;
		const items: string[] = req.body.itemList;
		await DataStoreService.instance.addInventoryItems(id, items);
		res.status(200).send();
	},
};

export const removeInventoryItems: Route = {
	route: "/inventory/:id/remove-items",
	method: "put",
	handler: async (req, res) => {
		const id = req.params.id;
		const items: string[] = req.body.itemNames;
		await DataStoreService.instance.removeInventoryItems(id, items);
		res.status(200).send();
	},
};
