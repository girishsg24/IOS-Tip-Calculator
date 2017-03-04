# Pre-work - *TipSter*

**TipSter** is a tip calculator application for iOS.

Submitted by: **Girish S G**

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

* [X] Implemented a rate customizer in the settings view.
* [X] The Rate Customizer is disabled until the user unlocks it using a switch & to save the user has to lock the switch again
* [X] Implimented a bill Splitter using a stepper
* [X] Automatic bill update when navigating from settings to main screen after the rate customer edit
* [X] Automatic bill update when navigating from settings to main screen after the number of persons update

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://cloud.githubusercontent.com/assets/22742130/23576251/2468e194-0055-11e7-9e96-657a2042f3e9.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Understanding the Swift framework was challenging. Regarding the app development, using steppers was an issue since it could go down to 0. Since I was using stepper to update the people count, my app should not go to 0 people. Another challenging task was auto update of the Tip amount & per person amount when the user makes modifications in the settings screen. All in all, it was a wonderful learning experience.

## License

    Copyright [2017] [Girish SG]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
