--An empty table for solving multiple kicking problem(thanks to @topkecleon )
kicktable = {}
local function run(msg, matches)
if msg.to.type == 'channel' then
    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_number'] then
                lock_tag = data[tostring(msg.to.id)]['settings']['lock_number']
            end
        end
    end
    local channel = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_tag == "yes" then
        send_large_msg(channel, '')
        delete_msg(msg.id, ok_cb, false)
    end
end
 end
return {
 usage = {
  "lock tag: If User Send A Message With # , @ Then Bot Removed User.",
  "unlock tag: No Action Execute If User Send Mesage With # , @",
  },
  patterns = {
 "^+98(.*)$",
 "^+98(.+)",
 "+98$",
 "^+98$",
"^+1(.*)$",
 "^+1(.+)",
 "+1$",
 "^+1$",
"^+63(.*)$",
 "^+63(.+)",
 "+63$",
 "^+63$",

 },
  run = run
}