-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

-- Trigger existing hyper key shortcuts

k:bind({}, '1', nil, function() hs.eventtap.keyStroke({"cmd","alt","shift","ctrl"}, '1') end)
k:bind({}, '2', nil, function() hs.eventtap.keyStroke({"cmd","alt","shift","ctrl"}, '2') end)
k:bind({}, '3', nil, function() hs.eventtap.keyStroke({"cmd","alt","shift","ctrl"}, '3') end)

-- OR build your own

launch = function(appname)
  hs.application.launchOrFocus(appname)
  k.triggered = true
end

-- Single keybinding for app launch
singleapps = {
  {'s', 'Slack'},
  {'t', 'iTerm'},
  {'f', 'Flowdock'},
  {'b', 'Google Chrome'}
}

for i, app in ipairs(singleapps) do
  k:bind({}, app[1], function() launch(app[2]); k:exit(); end)
end

-- Enter Hyper Mode when F18 (Hyper/Tab) is pressed
pressedF18 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Tab) is pressed,
-- send TAB if no other keys are pressed.
releasedF18 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'TAB')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)