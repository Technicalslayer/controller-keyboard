class_name FacegroupCollection
extends Node
## Represents multiple face groups that make up a full daisy wheel

var facegroups: Array[FaceGroupData]
var characterArray: PackedStringArray # all the characters being used in the collection
var greatest_angle # if calc angle is greater than this, it will be in the first group
