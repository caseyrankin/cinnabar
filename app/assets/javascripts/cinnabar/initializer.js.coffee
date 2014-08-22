# panels that we have not implemented backends for
delete window.Mercury.config.toolbars.primary.historyPanel
delete window.Mercury.config.toolbars.primary.notesPanel
delete window.Mercury.config.toolbars.primary.snippetPanel

# Not sure why mercury does not automatically exit after save ?
$(window).on 'mercury:saved', ->
  Mercury.trigger 'action', { action: 'exit' }

# what a shitty hack to initialize this
delay = (ms, func) -> setTimeout func, ms
Mercury.on 'action', (event) ->
  delay 1000, ->
    editor = $('#mercury_html_editor textarea')
    if editor.length
      CodeMirror.fromTextArea editor.get(0),
        lineNumbers: true
        styleActiveLine: true

$ ->
  new Mercury.PageEditor '/contents',
    saveStyle:  null, # 'form', or 'json' (default json)
    saveMethod: null, # 'PUT', or 'POST', (create, vs. update -- default PUT)
    visible:    true  # boolean - if the interface should start visible or not
