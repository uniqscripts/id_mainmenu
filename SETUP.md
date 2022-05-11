First of all, if you have no idea what you are doing, ask for support on our Discord server - https://discord.gg/WRknrjMZAS

If you want to change anything in the menu, for example: 
**SHOP > MY GARAGE**
you can do that in the HTML file, if you need help, we will be happy to provide it to you :)

# Setting up Level System:
- If you are using Level System (esx_xp), leave everything as it is.
- If you are not using Level System and do not want Level System to be showed in the menu then make sure you have done this:
Go to config.lua and set "GlobalState.LevelSystem = false"
- If you are using Level System but not esx_xp, ask for support on our Discord server and we will probably do that for you. 

# Setting up Inventory:
- If you are using ox_inventory (I recommend using ox_inventory), leave everything as it is.
- If you are using any other Inventory script, then you have to TriggerEvent for opening UI of that Inventory. For example:
esx_inventoryhud does not have trigger for opening it's UI, but it has function, so we will make trigger and put that function inside the trigger, it will look like this:
RegisterNetEvent("esx_inventoryhud:openInventory")
AddEventHandler("esx_inventoryhud:openInventory", function()
    openInventory()
end)
- If you still need help and do not know how to set it up, contact us on our Discord server.

# Setting up Billing:
- If you are using esx_billing, add this at the bottom of your client.lua file:
RegisterNetEvent("esx_billing:showBilling")
AddEventHandler("esx_billing:showBilling", function()
	ShowBillsMenu()
end)
- If you are not using esx_billing (for example okokBilling), you should do same as with setting up inventory/contact resource creator.

# Setting up Car Dealership:
- Again, you need to create Event for opening your vehicle shop's UI.
- After you have created Event, trigger it in the client.lua/101
- If you still need help and do not know how to set it up, contact us on our Discord server and we will probably do that for you.

# Setting up Shop:
- In the future, we will create our own shop script, but for now, you can use resources such as Core Credits.
- Again, you need to create Event for opening your vehicle shop's UI.
- After you have created Event, trigger it in the client.lua/109

# Setting up Job Center:
- Same as everything else.
- Soon, we will create our own job center script, but for now, you can use resources such as esx_jk_jobs

# Setting up Prime Account Button:
- You can add as many privileges as you want, but until next update, you have to do it like this:
Go to web/index.html and at the bottom of the file you will see already started row of privileges, you can change it's text (it can be as long as you want) and delete them, but when adding new you have to start the privilege with *-* and end it with *<br/>*. Sorry about that, it will be better in the next update (will go via GlobalState).
- If you do want resource for prime account button, give us some suggestions in the #suggestions channel on our Discord server - https://discord.gg/WRknrjMZAS
