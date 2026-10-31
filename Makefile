.PHONY: init
init:
	@defaults write com.apple.dock "autohide" -bool "true" && killall Dock
	@echo 'Autohide dock turned on.'

	@# Sketchybar requires this to be on, Aerospace prefers this to be off.
	@defaults write com.apple.spaces "spans-displays" -bool "true" && killall SystemUIServer
	@echo 'Displays have separate spaces turned on.'

	@brew services start sketchybar
	@echo 'Started Sketchybar service with brew.'

