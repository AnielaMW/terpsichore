/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

//= require jquery
//= require jquery_ujs

// import jQuery from 'jquery';
//
// window.jQuery = jQuery;

import { addBlankDirection } from '../dance_directions/add';
import { submitDCClick } from '../dance_comments/new';
import { submitDDDClick } from '../dances/new';
import { submitDDDEditClick } from '../dances/edit';
import 'dance_directions/edit';
import 'dance_directions/new';
import 'sitewide';

$(document).ready(() => {
  $('#dance-new').on('click', '#dd-add', addBlankDirection);
  $('#dance-edit').on('click', '#dd-add', addBlankDirection);
  $('#dance-show #dc-form').submit(submitDCClick);
  $('form#new_dance').submit(submitDDDClick);
  $('form.edit_dance').submit(submitDDDEditClick);
});
