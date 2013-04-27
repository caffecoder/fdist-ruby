Simple RUBY file distribution library.
========================================

## Example of usage:

```ruby
fd = FileDistribution.new("/tmp/storage")

database_id = 1
fd.hex_path(database_id)
fd.rename_from("/tmp/upload/file1.txt")

database_id = 256
fd.hex_path(database_id)
fd.rename_from("/tmp/upload/file2.txt")
```

Files should be stored in /tmp/storage/01.dat and /tmp/storage/01/00.dat