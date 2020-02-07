{
  "type" : "object",
  "properties" : {

    <@lib.property
        name = "type"
        type = "string"
        enum = true
        enumValues = ['"cancel"', '"startBeforeActivity"', '"startAfterActivity"', '"startTransition"']
        description = "Mandatory. One of the following values: cancel, startBeforeActivity, startAfterActivity, startTransition.
        * A cancel instruction requests cancellation of a single activity instance or all instances of one activity.
        * A startBeforeActivity instruction requests to enter a given activity.
        * A startAfterActivity instruction requests to execute the single outgoing sequence flow of a given activity.
        * A startTransition instruction requests to execute a specific sequence flow." />

    <@lib.property
        name = "variables"
        type = "ref"
        dto = "TriggerVariableValueDto" />

    <@lib.property
        name = "activityId"
        type = "string"
        description = "Can be used with instructions of types startTransition. Specifies the sequence flow to start." />

    <@lib.property
        name = "transitionId"
        type = "string"
        description = "Can be used with instructions of types startTransition. Specifies the sequence flow to start." />

    <@lib.property
        name = "activityInstanceId"
        type = "string"
        description = "Can be used with instructions of type cancel. Specifies the activity instance to cancel.
        Valid values are the activity instance IDs supplied by the Get Activity Instance request (https://docs.camunda.org/manual/latest/reference/rest/process-instance/get-activity-instances/)." />

    <@lib.property
        name = "transitionInstanceId"
        type = "string"
        description = "Can be used with instructions of type cancel. Specifies the transition instance to cancel.
        Valid values are the transition instance IDs supplied by the Get Activity Instance request (https://docs.camunda.org/manual/latest/reference/rest/process-instance/get-activity-instances/)." />

    <@lib.property
        name = "ancestorActivityInstanceId"
        type = "string"
        description = "Can be used with instructions of type startBeforeActivity, startAfterActivity, and startTransition.
        Valid values are the activity instance IDs supplied by the Get Activity Instance request.
        If there are multiple parent activity instances of the targeted activity, this specifies the ancestor scope in which hierarchy the activity/transition is to be instantiated.\nExample: When there are two instances of a subprocess and an activity contained in the subprocess is to be started, this parameter allows to specifiy under which subprocess instance the activity should be started." />

    <@lib.property
        name = "cancelCurrentActiveActivityInstances"
        type = "boolean"
        last = true
        description = "Can be used with instructions of type cancel. Prevents the deletion of new created activity instances." />

  },
  "discriminator" : {
    "propertyName" : "type"
  },
  "required": [
    "type"
  ]
}