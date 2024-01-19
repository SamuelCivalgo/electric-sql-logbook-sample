Step 0: Install dependencies using `yarn install`.

Step 1: Set up a Supabase project. Obtain the database URI and include it in:
 - `.env` file as `DATABASE_URL`.
 - `fly.toml` file.

Step 2: Establish a server for the electric project with fly.io.
 - Execute: `yarn run electric:fly-new-launch`.
 - Generate `PROXY_DATABASE_URL` in the `.env` file using the new server's URL (Password as specified in `fly.toml` file, default: `proxyPassword`).
 - Modify the script in `package.json` `electric:generate-client` to reflect the new server URL.
 - Update the URL in `useElectricProviderDb.ts` file with the new server URL.

In case of errors, execute `yarn run electric:fly-update` to update the server.

Step 3: Migrate the database.
 - Run: `yarn run db:migrate`.

Step 4: Electrify all tables.
 - Execute: `yarn run electric:reset-electrification`.

Step 5: Generate the electric client.
 - Run: `yarn run electric:generate-client`.

Step 6: Launch the app. Connect your mobile phone via USB cable and then execute:
 - `yarn run android`.

Expected Outcome: The app's screen should display a list of users. In the Supabase interface, data synchronization with the cloud database should be observable. Any changes made in the cloud database should reflect in the app synchronously.
