import express, { Express, IRouterMatcher } from "express";
import { test_route } from "./routes/test";
import { routes } from "./routes/route";

const app: Express = express();
app.use(express.json());
const port = 8080;

for (const route of routes) {
	const handler = route.handler;
	const url = route.route;

	switch (route.method) {
		case "get":
			app.get(url, handler);
			break;
		case "post":
			app.post(url, handler);
			break;
		case "put":
			app.put(url, handler);
			break;
		case "delete":
			app.delete(url, handler);
			break;
	}
}

app.listen(port, () => {
	console.log(`️[server]: Server is running at http://localhost:${port}`);
});