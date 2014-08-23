# what a shitty hack to initialize this
Mercury.on 'action', (event, data) ->
  if data.action == 'htmlEditor'
    setTimeout initialize_codemirror, 750

initialize_codemirror = ->
  editor = CodeMirror.fromTextArea $('#mercury_html_editor textarea').get(0),
    lineNumbers: true
    mode: 'htmlmixed'
    styleActiveLine: true

  # auto format all the html
  totalLines = editor.lineCount()
  totalChars = editor.getTextArea().value.length
  editor.autoFormatRange({line:0, ch:0}, {line:totalLines, ch:totalChars})

  # not sure why codemirror is not automatically updating the mercury textarea
  editor.on 'change', ->
    editor.save()
