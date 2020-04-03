# Assetto Corsa Server Manager

AC UDP protocol Ver.4

58, ACSP_CLIENT_LOADED
C, car id

51, ACSP_NEW_CONNECTION
C, length
A4*length, driver name
C, length
A4*length, driver guid
C, car id
C, length
A*length, car model
C, length
A*length, car skin

130, ACSP_CLIENT_EVENT
C, event type
C, car id
if ACSP_CE_COLLISION_WITH_CAR
  C, other car id
F, impact speed
F, world pos vector x
F, world pos vector y
F, world pos vector z
F, rel pos vector x
F, rel pos vector y
F, rel pos vector z

10, ACSP_CE_COLLISION_WITH_CAR
11, ACSP_CE_COLLISION_WITH_ENV

73, ACSP_LAP_COMPLETED
C, car id
L, lap time
C, cuts
C, cars count
cars count times
  C, car id
  L, rtime
  C, rlaps
  C2, unknown

52, ACSP_CONNECTION_CLOSED
C, length
A4*length, driver name
C, length
A4*length, driver guid
C, car id
C, length
A*length, car model
C, length
A*length, car skin

50, ACSP_NEW_SESSION
C, version
C, session index
C, current session index
C, session count
C, length
A4*length, server name
C, length
A*length, track name
C, length
A*length, track config
C, length
A*length, session name
C, typ
S, session time
S, laps
S, wait time
C, ambient temp
C, road temp
C, length
A*length, weather graphics
l, elapsed ms

59, ACSP_SESSION_INFO
same as 50

55, ACSP_END_SESSION
C, length
A4*length, saved file name

56, ACSP_VERSION
C, version
