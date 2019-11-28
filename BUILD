load("@rules_buildstream//buildstream:rules.bzl", "bst_element")

bst_element(
    name = "fdsdk",
    build_file = "@bazel_toolchains_fdsdk//:BUILD",
    repository = "@bazel_toolchains_fdsdk//:project.conf",
    element = "toolchain-complete-x86_64.bst",
)


# cc_binary(
#     name = "hello-world",
#     srcs = ["hello-world.cc"],
# )

# platform(
#     name = "linux",
#     constraint_values = [
#         "@bazel_tools//platforms:x86_64",
#         "@bazel_tools//platforms:linux",
#     ],
# )
