/*
 * Copyright 2015 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use strict';
goog.provide('safelight.builderDirective');

goog.require('safelight.BuilderController');



/**
 * Widget for driving safelight.Builder.
 *
 * Usage:
 * <builder></builder>
 *
 * @return {!angular.Directive}
 */
safelight.builderDirective = function() {
  return {
    restrict: 'E',
    scope: {
      builder: '=',
      // Expose builderCtrl.build() to the isolate scope
      build: '&'
    },
    templateUrl: '/components/builder/builder_directive.html',
    controller: safelight.BuilderController,
    controllerAs: 'builderCtrl'
  };
};
