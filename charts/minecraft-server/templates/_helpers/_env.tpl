{{/*
Minecraft Server version
*/}}
{{- define "minecraft.env.versions" }}
{{- $type := .Values.server.type }}
{{- $versions := .Values.server.versions }}

{{- include "minecraft.utils.envMap" ( dict "key" "TYPE" "value" $type ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "VERSION" "value" $versions.minecraftLauncher ) }}

{{- if eq $type "fabric" }}
{{- include "minecraft.utils.envMap" ( dict "key" "FABRIC_LAUNCHER_VERSION" "value" $versions.fabricLauncher ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "FABRIC_LOADER_VERSION" "value" $versions.fabricLoader ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "FABRIC_LAUNCHER_URL" "value" $versions.fabricLauncherUrl ) }}

{{- else if eq $type "forge" }}
{{- include "minecraft.utils.envMap" ( dict "key" "FORGE_VERSION" "value" $versions.forgeLauncher ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "FORGE_INSTALLER_URL" "value" $versions.forgeInstallerUrl) }}

{{- else if eq $type "neoforge" }}
{{- include "minecraft.utils.envMap" ( dict "key" "NEOFORGE_VERSION" "value" $versions.forgeLauncher ) }}

{{- else if eq $type "sponge" }}
{{- include "minecraft.utils.envMap" ( dict "key" "SPONGEVERSION" "value" $versions.spongeVersion ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "SPONGEBRANCH" "value" $versions.spongeBranch ) }}

{{- else if eq $type ( or "limbo" "nanolimbo" ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "LIMBO_BUILD" "value" $versions.limboBuild ) }}

{{- else if eq $type "papper" }}
{{- include "minecraft.utils.envMap" ( dict "key" "PAPER_BUILD" "value" $versions.paperBuild ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "PAPER_CHANNEL" "value" $versions.paperChannel ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "PAPER_DOWNLOAD_URL" "value" $versions.paperDownloadUrl ) }}

{{- else if eq $type "pufferfish" }}
{{- include "minecraft.utils.envMap" ( dict "key" "PUFFERFISH_BUILD" "value" $versions.pufferfishBuild ) }}

{{- else if eq $type "purpur" }}
{{- include "minecraft.utils.envMap" ( dict "key" "PURPUR_BUILD" "value" $versions.purpurBuild ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "PURPUR_DOWNLOAD_URL" "value" $versions.purpurDownloadUrl ) }}

{{- else if eq $type "leaf" }}
{{- include "minecraft.utils.envMap" ( dict "key" "LEAF_BUILD" "value" $versions.leafBuild ) }}

{{- else if eq $type "folia" }}
{{- include "minecraft.utils.envMap" ( dict "key" "FOLIA_BUILD" "value" $versions.foliaBuild ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "FOLIA_CHANNEL" "value" $versions.foliaChannel ) }}

{{- else if eq $type "quilt" }}
{{- include "minecraft.utils.envMap" ( dict "key" "QUILT_LOADER_VERSION" "value" $versions.quiltLoaderVersion ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "QUILT_INSTALLER_VERSION" "value" $versions.quiltInstallerVersion ) }}

{{- else if eq $type "ftba" }}
{{- include "minecraft.utils.envMap" ( dict "key" "FTB_MODPACK_ID" "value" $versions.ftbModpackId ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "FTB_MODPACK_VERSION_ID" "value" $versions.ftbModpackVersionId ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "FTB_FORCE_REINSTALL " "value" $versions.ftbForceReinstall ) }}
{{- end }}
{{- end }}

{{/*
Minecraft Server properties
*/}}
{{- define "minecraft.env.properties" }}
{{- $properties := .Values.server.properties }}

{{- if ne $properties.eula "true" }}
{{- fail "Please accept the end user license agreement" }}
{{- end }}
{{- include "minecraft.utils.envMap" ( dict "key" "EULA" "value" $properties.eula ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "LEVEL_NAME" "value" $properties.levelName ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "MOTD" "value" $properties.motd ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "GAMEMODE" "value" $properties.gamemode ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "DIFFICULTY" "value" $properties.difficulty ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "HARDCORE" "value" $properties.hardcore ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "PVP" "value" $properties.pvp ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "LEVEL_SEED" "value" $properties.levelSeed ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "LEVEL_TYPE" "value" $properties.levelType ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "GENERATE_STRUCTURES" "value" $properties.generateStructures ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "ENABLE_COMMAND_BLOCK" "value" $properties.enableCommandBlock ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "ALLOW_FLIGHT" "value" $properties.allowFlight ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "ALLOW_NETHER" "value" $properties.allowNether ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "SPAWN_MONSTERS" "value" $properties.spawnMonsters ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "SPAWN_NPCS" "value" $properties.spawnNpcs ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "SPAWN_ANIMALS" "value" $properties.spawnAnimals ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "SPAWN_PROTECTION" "value" $properties.spawnProtection ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "MAX_PLAYERS" "value" $properties.maxPlayers ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "MAX_WORLD_SIZE" "value" $properties.maxWorldSize ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "VIEW_DISTANCE" "value" $properties.viewDistance ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "SIMULATION_DISTANCE" "value" $properties.simulationDistance ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "ENABLE_STATUS" "value" $properties.enableStatus ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "ONLINE_MODE" "value" $properties.onlineMode ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "USE_NATIVE_TRANSPORT" "value" $properties.useNativeTransport ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "PREVENT_PROXY_CONNECTIONS" "value" $properties.preventProxyConnections ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "NETWORK_COMPRESSION_THRESHOLD" "value" $properties.networkCompressionThreshold ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "ENABLE_JMX_MONITORING" "value" $properties.enableJmxMonitoring ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "SYNC_CHUNK_WRITES" "value" $properties.syncChunkWrites ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "ENTITY_BROADCAST_RANGE_PERCENTAGE" "value" $properties.entityBroadcastRangePercentage ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "PLAYER_IDLE_TIMEOUT" "value" $properties.playerIdleTimeout ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "OP_PERMISSION_LEVEL" "value" $properties.opPermissionLevel ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "FUNCTION_PERMISSION_LEVEL" "value" $properties.functionPermissionLevel ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "BROADCAST_RCON_TO_OPS" "value" $properties.broadcastRconToOps ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "FORCE_GAMEMODE" "value" $properties.forceGamemode ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "RESOURCE_PACK" "value" $properties.resourcePack ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "RESOURCE_PACK_SHA1" "value" $properties.resourcePackSha1 ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "RESOURCE_PACK_ENFORCE" "value" $properties.resourcePackEnforce ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "ENABLE_WHITELIST" "value" $properties.enableWhitelist ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "WHITELIST" "value" ( join "," $properties.whitelist ) ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "WHITELIST_FILE" "value" $properties.whitelistFile ) }}
{{- end }}

{{/*
Minecraft container configuration
*/}}
{{- define "minecraft.env.container" }}
- name: "INIT_MEMORY"
  valueFrom:
    resourceFieldRef:
      containerName: server
      resource: requests.memory
- name: "MAX_MEMORY"
  valueFrom:
    resourceFieldRef:
      containerName: server
      resource: limits.memory
{{- end }}

{{/*
Rcon configuration
*/}}
{{- define "minecraft.env.rcon" }}
{{- $rcon := .Values.rcon }}

{{- include "minecraft.utils.envMap" ( dict "key" "ENABLE_RCON" "value" $rcon.enabled ) }}
{{- if eq ( include "minecraft.common.isRconEnabled" . ) "true" }}
{{- include "minecraft.utils.envMap" ( dict "key" "RCON_HOST" "value" "localhost" ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "RCON_PORT" "value" $rcon.port ) }}
- name: "RCON_PASSWORD"
  valueFrom:
    secretKeyRef:
      name: {{ include "minecraft.common.rconSecretName" . }}
      key: {{ include "minecraft.common.rconSecretKey" . }}
{{- end }}
{{- end }}

{{/*
Assets management configuration
*/}}
{{- define "minecraft.env.assets" }}
{{- $type := .Values.server.assets.type }}
{{- $source := .Values.server.assets.source }}

{{- if eq $type "packwiz" }}
{{- include "minecraft.utils.envMap" ( dict "key" "PACKWIZ_URL" "value" $source.packwizUrl ) }}
{{- end }}

{{- if eq $type "modrinth" }}
{{- include "minecraft.utils.envMap" ( dict "key" "MODRINTH_PROJECTS" "value" ( join "," $source.modrinthProjects ) ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "MODRINTH_DOWNLOAD_DEPENDENCIES" "value" $source.modrinthDownloadDependencies ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "MODRINTH_ALLOW_VERSION_TYPE" "value" $source.modrinthAllowVersionType ) }}
{{- end }}

{{- if eq $type "curseforge" }}
{{- include "minecraft.utils.envMap" ( dict "key" "CURSEFORGE_FILES" "value" ( join "," $source.curseforgeFiles ) ) }}
- name: "CF_API_KEY"
  valueFrom:
    secretKeyRef:
      name: {{ include "minecraft.common.curseforgeSecretName" . }}
      key: {{ include "minecraft.common.curseforgeSecretKey" . }}
{{- end }}

{{- if eq $type "spiget" }}
{{- include "minecraft.utils.envMap" ( dict "key" "SPIGET_RESOURCES" "value" ( join "," $source.spigetResources ) ) }}
{{- end }}

{{- end }}

{{/*
Backup configuration
*/}}
{{- define "minecraft.env.backup" }}
{{- $backup := .Values.backup.config }}
{{- $rcon := .Values.rcon }}

{{- include "minecraft.utils.envMap" ( dict "key" "SERVER_PORT" "value" 25565 ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "RCON_HOST" "value" "localhost" ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "RCON_RETRIES" "value" $backup.rconRetries ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "RCON_RETRY_INTERVAL" "value" $backup.rconRetryInterval ) }}
- name: "RCON_PASSWORD"
  valueFrom:
    secretKeyRef:
      name: {{ include "minecraft.common.rconSecretName" . }}
      key: {{ include "minecraft.common.rconSecretKey" . }}

{{- include "minecraft.utils.envMap" ( dict "key" "SRC_DIR" "value" "/data" ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "DEST_DIR" "value" "/backups" ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "BACKUP_NAME" "value" $backup.backupName ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "BACKUP_INTERVAL" "value" $backup.backupInterval ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "BACKUP_ON_STARTUP" "value" $backup.backupOnStartup ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "INITIAL_DELAY" "value" $backup.initialDelay ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "PAUSE_IF_NO_PLAYERS" "value" $backup.pauseIfNoPlayers ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "PLAYERS_CHECK_INTERVAL" "value" $backup.playersOnlineCheckInterval ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "PRUNE_BACKUP_DAYS" "value" $backup.pruneBackupDays ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "PRUNE_BACKUP_COUNT" "value" $backup.pruneBackupCount ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "ENABLE_SAVE_ALL" "value" $backup.enableSaveAll ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "ENABLE_SYNC" "value" $backup.enableSync ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "INCLUDES" "value" ( join "," $backup.includes ) ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "EXCLUDES" "value" ( join "," $backup.excludes ) ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "ZSTD_PARAMETERS" "value" ( join "," $backup.zstdParameters ) ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "LINK_LATEST" "value" $backup.linkLatest ) }}

{{- include "minecraft.utils.envMap" ( dict "key" "BACKUP_METHOD" "value" $backup.type ) }}

{{- if eq $backup.type "tar" }}
{{- include "minecraft.utils.envMap" ( dict "key" "TAR_COMPRESS_METHOD" "value" $backup.tarCompressMethod ) }}
{{- end }}

{{- if eq $backup.type "rclone" }}
{{- include "minecraft.utils.envMap" ( dict "key" "RCLONE_REMOTE" "value" $backup.rcloneRemote ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "RCLONE_COMPRESS_METHOD" "value" $backup.rcloneCompressMethod ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "RCLONE_DEST_DIR" "value" $backup.rcloneDestDir ) }}
{{- end }}

{{- if eq $backup.type "restic" }}
{{- if or $backup.resticPassword $backup.resticExistingSecret }}
- name: RESTIC_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "minecraft.common.resticSecretName" . }}
      key: {{ include "minecraft.common.resticSecretKey" . }}
{{- end }}
{{- include "minecraft.utils.envMap" ( dict "key" "RESTIC_REPOSITORY" "value" $backup.resticRepository ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "RESTIC_ADDITIONAL_TAGS" "value" ( join " " $backup.resticAdditionalTags ) ) }}
{{- include "minecraft.utils.envMap" ( dict "key" "PRUNE_RESTIC_ATTENTION" "value" $backup.resticPruneAttention ) }}
{{- end }}

{{- end }}

{{- define "minecraft.env.metrics" }}
{{- include "minecraft.utils.envMap" ( dict "key" "EXPORT_SERVERS" "value" "localhost:25565" ) }}
{{- end }}
