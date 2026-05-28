export module ./cloud
export module ./local

# The backup system is devided in 2 subsystems (local and cloud based)
# 1. Local
# - the local backup is done based on user's request (hopefully once every month)
# - there will be an annoying reminder once the backup becomes older that that
# - it simply sync all the backed directories to the drive
# 2. Cloud
#	- the cloud based backup happens every day (provided that the system is lunched)
# - it uses a checksum file left by the last local backup to calc a diff
# - it syncs changes (new files and updated files) to the cloud
# - deleted files since the last local backup can be computed by checking the existance
#		of files in the checksum
# restoring can either use only the local backup if it's complete or both (local and cloud)
# in the latter case, a local restore is done first then a cloud restore is applied on top of it
export def main [] {}
