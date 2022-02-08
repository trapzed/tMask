--[[   

         tttt          MMMMMMMM               MMMMMMMM                                  kkkkkkkk           
      ttt:::t          M:::::::M             M:::::::M                                  k::::::k           
      t:::::t          M::::::::M           M::::::::M                                  k::::::k           
      t:::::t          M:::::::::M         M:::::::::M                                  k::::::k           
ttttttt:::::ttttttt    M::::::::::M       M::::::::::M  aaaaaaaaaaaaa      ssssssssss    k:::::k    kkkkkkk
t:::::::::::::::::t    M:::::::::::M     M:::::::::::M  a::::::::::::a   ss::::::::::s   k:::::k   k:::::k 
t:::::::::::::::::t    M:::::::M::::M   M::::M:::::::M  aaaaaaaaa:::::ass:::::::::::::s  k:::::k  k:::::k  
tttttt:::::::tttttt    M::::::M M::::M M::::M M::::::M           a::::as::::::ssss:::::s k:::::k k:::::k   
      t:::::t          M::::::M  M::::M::::M  M::::::M    aaaaaaa:::::a s:::::s  ssssss  k::::::k:::::k    
      t:::::t          M::::::M   M:::::::M   M::::::M  aa::::::::::::a   s::::::s       k:::::::::::k     
      t:::::t          M::::::M    M:::::M    M::::::M a::::aaaa::::::a      s::::::s    k:::::::::::k     
      t:::::t    ttttttM::::::M     MMMMM     M::::::Ma::::a    a:::::assssss   s:::::s  k::::::k:::::k    
      t::::::tttt:::::tM::::::M               M::::::Ma::::a    a:::::as:::::ssss::::::sk::::::k k:::::k   
      tt::::::::::::::tM::::::M               M::::::Ma:::::aaaa::::::as::::::::::::::s k::::::k  k:::::k  
        tt:::::::::::ttM::::::M               M::::::M a::::::::::aa:::as:::::::::::ss  k::::::k   k:::::k 
          ttttttttttt  MMMMMMMM               MMMMMMMM  aaaaaaaaaa  aaaa sssssssssss    kkkkkkkk    kkkkkkk
                                                                                                                
   tMask made by TrapZed#1725

   https://github.com/trapzed
   
   🛠️ tDev : https://discord.gg/WEP4CuuQzd
]]--

Config = {}

-- Pour les bases California, mettez la valeur : ::{korioz#0110}:: devant les triggers exemple : 
--Config.events = {
--    ["esx:getSharedObject"] = "::{korioz#0110}::esx:getSharedObject",
--}
Config.Events = {
  ["esx:getSharedObject"] = "esx:getSharedObject",
  ["esx:showNotification"] = "esx:showNotification"
}

-- Position du blips / marker
Config.Pos = vector3(-1337.69, -1277.76, 4.84)

-- Prix 
Config.Price = 75