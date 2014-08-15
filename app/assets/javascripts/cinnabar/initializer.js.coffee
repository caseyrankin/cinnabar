# panels that we have not implemented backends for
window.Mercury.config.toolbars.primary.insertMedia = ''
window.Mercury.config.toolbars.primary.historyPanel = ''
window.Mercury.config.toolbars.primary.notesPanel = ''
window.Mercury.config.toolbars.primary.snippetPanel = ''

# attempt to add a cancel button
window.Mercury.config.toolbars.primary.cancelOut = ['Cancel', 'Leave editor without saving changes', { regions: ['full', 'markdown', 'simple'] }];
window.Mercury.config.globalBehaviors.cancelOut = ->
  Mercury.trigger 'action', { action: 'exit' }

# Not sure why mercury does not automatically exit after save ?
$(window).on 'mercury:saved', ->
  Mercury.trigger 'action', { action: 'exit' }

$ ->
  new Mercury.PageEditor '/contents',
    saveStyle:  null, # 'form', or 'json' (default json)
    saveMethod: null, # 'PUT', or 'POST', (create, vs. update -- default PUT)
    visible:    true  # boolean - if the interface should start visible or not
