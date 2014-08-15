window.Mercury.config.globalBehaviors.cancelOut = ->
  Mercury.trigger 'action', { action: 'exit' }

clone = window.Mercury.config.toolbars.primary
window.Mercury.config.toolbars.primary = {}

# insert cancel button after preview
for own key of clone
  window.Mercury.config.toolbars.primary[key] = clone[key]
  if key == 'preview'
    window.Mercury.config.toolbars.primary.cancelOut = ['Cancel', 'Leave editor without saving changes']
