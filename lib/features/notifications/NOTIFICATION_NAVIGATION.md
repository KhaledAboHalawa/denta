# Notifications navigation integration

Notifications now carry a typed destination and destination identifier:

- `NotificationEntity.targetType`: the destination category (case, appointment, session, marketplace item, etc.).
- `NotificationEntity.targetId`: the backend identifier of the specific object.
- `NotificationsScreen.onNotificationTap`: the single navigation integration point. It is called after the notification is marked as read.

When the destination features/routes are available, pass a callback from the app router/screen owner and switch on `targetType`, using `targetId` as the route parameter. Do not navigate by notification `id`: that identifies the notification itself, not the case/item it refers to.

The current repository does not include case details, appointment details, review details, or marketplace detail routes. Therefore this feature deliberately does not push invented route paths that would fail at runtime. The local mock IDs (`case-101`, `item-501`, etc.) are illustrative only; production notifications should populate `targetType` and `targetId` from the API response.


## Incoming notification updates (backend-ready)

The presentation layer listens to `NotificationsRepository.watchNotifications()`
through `GetNotificationsUseCase.watch()`. When the data source emits a new
snapshot, `NotificationsCubit` updates the existing screen automatically. The
current local data source publishes updates when a notification is received or
marked as read.

For manual local testing, call `receiveMockNotification` on the registered
`NotificationsLocalDataSource` with a new `NotificationModel` ID. This only
simulates an in-app update while the app is running; it does not deliver remote
push notifications. When the backend is available, implement the same repository
stream using the agreed API/realtime transport. Background or terminated-app
push delivery will still require push setup (for example FCM) and backend support.
