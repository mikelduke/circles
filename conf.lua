-- Configuration
function love.conf(t)
	t.title = "Circle Fill"
	t.version = "11.2"
	t.gameversion = "0.1"
	t.window.title = "Circle Fill"
    t.window.resizable = true
    t.window.fullscreen = true
    t.window.fullscreentype = exclusive
    t.window.borderless = true

	-- For Windows debugging
	t.console = true
end
