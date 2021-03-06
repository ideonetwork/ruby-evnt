# Evnt changelog

## Vesion 3.7.0

- Added validation option :do on commands ro run custom functions on validation.

## Vesion 3.6.6

- Real fix extras parameters validations for _options.

## Vesion 3.6.5

- Fix extras parameters validations for _options.

## Vesion 3.6.4

- Bug Fix.

## Vesion 3.6.3

- Added support to extras validation on events.
- Renamed attributes to payload_attributes on events.

## Vesion 3.6.2

- Added support to custom error code on command params validation.

## Vesion 3.6.1

- Added support to ActiveSupport::HashWithIndifferentAccess on hash type validator.

## Vesion 3.6.0

- Removed deprecation for method 'handlers_are'.
- Removed query support.

## Vesion 3.5.0

- Added listen method to add events on handler.
- Added deprecation for method 'handlers_are'.

## Vesion 3.4.0

- Added initial query support.

## Vesion 3.3.0

- Added possibility to set an event as seved or not.
- Updated event generator to remove _event string from events names.

## Vesion 3.2.6

- Added "--migrated" option on initializer generator to generate a model to save events.
- Added pretty documentation.
- Fixed event name not saved on payload.

## Version 3.2.5

- Fixed bad errors.

## Version 3.2.4

- Fixed bad errors.

## Version 3.2.3

- Fixed bad errors.

## Version 3.2.2

- Fixed event attributes concat.

## Version 3.2.1

- Fixed tests.
- Updated documentation.

## Version 3.2.0

- New update for classes inheritance (explained below).

All instance variables defined on commands and events classes are transformed in methods so values can be merged with superclass values (settings can be inherited).

Now can be executed events code like this example:

```ruby
class AnimalEvent < Evnt::Event

  attributes_are :type, :sex

end

class AquaticAnimalEvent < AnimalEvent

  attributes_are :water_type

end

shark = AquaticAnimalEvent.new(
  type: 'aquatic',
  sex: 'male',
  water_type: 'salt'
)

puts shark.attributes # -> [:type, :sex, :water_type]
```

This functionality works with:

* Commands default options.
* Commands validations.
* Events default options.
* Events attributes.
* Events handlers.

## Version 3.1.4

- Fixed default options merge.

## Version 3.1.3

- Added nullify_empty_params option on command to set to nil empty paramteters.
- Added default_options support for commands and events.

## Version 3.1.2

- Added min length and max length on validator string options.
- Added min and max on validator time options.
- Added custom error message on command validators.

## Version 3.1.1

- Added equal option on validator global options.
- Added regex option on validator string options.

## Version 3.1.0

- Updated validator class with new awesome structure.
- Added some validation options on validator.
- Updated documentation.

## Version 3.0.2

- Added initializer generator for Ruby on Rails application.
- Added command generator for Ruby on Rails application.
- Added event generator for Ruby on Rails application.
- Added handler generator for Ruby on Rails application.
- Fixed required parameters on command and event initializer.
- Fixed command exception error.

## Version 3.0.1

- Added options support to events.
- Added silent option to events to avoid the call of handlers.
- Added to_normalize_params block on commands to change parameters before validations.
- Removed params freeze after the single params validation on commands.

## Version 3.0

- Added validator datetime type tests.
- Updated type validators to support values from a web application controller. For example the "true" string should be accepted as a boolean value.

## Version 2.1.6

- Added datetime type validation on validator class.

## Version 2.1.5

- Fixed date validator to not support string date.

## Version 2.1.4

- Fixed handler with multiple events errors. Now the **on** method of the handler should call the block immediately and the methods used on the event have different names for each event.

## Version 2.1.3

- Added date type on type validator.

## Version 2.1.2

- Updated event extras hash to have keys without the "_" first char.

## Version 2.1.1

- Initialize numeric validation on validator.
- Added error management on validator public functions.
- Added nil value accepted on validate types validator.
- Added secondary informations on gem description.

## Version 2.1.0

- Initialize code examples on repository.
- Rename the "stop" function inside commands to "err".
- Add single validation for commands parameters with the Validator class.
- Update tests.

## Version 2.0.1

- Rename "throw" function to "stop" inside commands.
- Fix payload validation inside event.

## Version 2.0

- Rename actions to commands.
- Add possibility to share extra data not saved on event payload from command to event and from event to handlers.
- Update handlers structure.

## Version 1.0.3

- Remove rails generators.

## Version 1.0.2

- Update tests structure.
- Add informations to load gem on rubygems.

## Version 1.0.1

- Add rails generators to initialize gem on rails projects.
- Add rails generators to initialize users authentication events.
- Add rails generators to initialize crud events.

## Version 1.0

- First official release.
