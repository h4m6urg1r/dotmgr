-- Creates notification window for naughty
RC.libs.ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    RC.libs.ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = RC.libs.awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)

RC.libs.naughty.connect_signal("request::display", function(n)
    RC.libs.naughty.layout.box { notification = n }
end)

