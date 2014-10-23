$(document).ready ->
  feedbackIcon = (el, klass) ->
    if klass == 'glyphicon-ok'
      reverseKlass = 'glyphicon-remove'
    else
      reverseKlass = 'glyphicon-ok'

    if $(el).siblings('.form-control-feedback').length
      $(el).siblings('.form-control-feedback').removeClass(reverseKlass).addClass(klass)
    else
      $(el).parent().append("<span class='form-control-feedback glyphicon #{klass}'></span>")

  $('.simple_form').find('.required.form-control').each ->
    $(this).on 'blur', ->
      judge.validate(document.getElementById(this.id), {
        valid: (el) ->
          $(el).closest('.form-group').removeClass('has-error').addClass('has-success')
          feedbackIcon(el, 'glyphicon-ok')
          $(el).siblings('.has-error').remove()
        invalid: (el, messages) ->
          $(el).closest('.form-group').removeClass('has-success').addClass('has-error')
          feedbackIcon(el, 'glyphicon-remove')
          error_messages = messages.join(', ')
          if $(el).siblings('.has-error').length
            $(el).siblings('.has-error').text(error_messages)
          else
            $(el).parent().append("<span class='help-block has-error'>#{error_messages}</span>")
      })