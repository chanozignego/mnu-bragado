function setDataOnChange(selector, next) {
  $(selector.field).on('change', function() {
    var id = $(this).val();
    $(next.field).select2('val', '');
    $(next.field).attr('disabled', false);

    var placeholder = $(next.field).attr('placeholder') ||
                           $element.data('placeholder') ||
                           'Elija una opción';

    $(next.field).select2({
      ajax: {
        url: next.url,
        dataType: 'json',
        type: 'GET',
        data: function(params) {
            if (params.term === undefined) {
              params.term = '';
            }
            return {
              school_id: id,
              text: params.term
            };
        },
        processResults: function(data) {
          var results = [];
          for (var key in data) {
            var res = data[key];
            results.push({id: res.id, text: res.name});
          }
          return {results: results, more: false};
        }
      },
      allowClear: true,
      placeholder: placeholder,
      locale: I18n.locale,
      language: {
        noResults: function() {
          return 'No se encontraron resultados';
        },
        searching: function() {
          return 'Buscando...';
        },
        loadingMore: function() {
          return 'Cargando más resultados...';
        },
        inputTooShort: function() {
          return 'Escriba al menos 3 letras';
        }
      }
    });
  });
}

function setCheckboxOnChange(selector, next) {
  $(next).attr('disabled', !$(selector).is(':checked'));
  $(selector).change(function() {
    $(next).attr('disabled', !$(this).is(':checked'));
  });
}

// function setChecked() {
//   $(next).attr("disabled", !$(this).is(":checked"));
// }

$(document).ready(function() {
  this.school = {field: '.js-school-field',
                  url: null};
  this.professor = {field: '.js-professor-field',
                    url: '/professors/get_by_school'};
  //this.partaker = {field: '.js-partaker-field',
  //                    url: Routes.cities_by_zone_path()};

  setDataOnChange(this.school, this.professor);
  //this.setDataOnChange(this.professor, this.partaker);

  //setCheckboxOnChange('#has_chronic_desease_checkbox', '#has_chronic_desease_detail');

  $('.js-date-field').inputmask('99/99/9999');

});
