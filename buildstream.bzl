def _bst_build(ctx, srcs, element):
    logfile = ctx.actions.declare_file("logfile")
    ctx.actions.run_shell(
        outputs=[logfile],
        command = "bst build {} | tee {}".format(ctx.attr.element, logfile.path),
        inputs = ctx.attr.srcs.files, # The entire buildstream project
        use_default_shell_env = True,
    )
    return logfile

def _bst_checkout(ctx, srcs, element):
    checkout = ctx.actions.declare_directory(ctx.label.name)
    ctx.actions.run_shell(
        outputs = [checkout],
        command = "bst artifact checkout {} --directory {}".format(ctx.attr.element, checkout.path),
        inputs = ctx.attr.srcs.files,
        use_default_shell_env = True,
    )
    return checkout

def _bst_element_impl(ctx):
    print("target: " + ctx.label.name)
    print("input files: " + " ".join([f.path for f in ctx.attr.srcs.files.to_list()]))

    srcs = ctx.attr.srcs.files
    element = ctx.attr.element
    logfile = _bst_build(ctx, srcs, element)

    checkout = _bst_checkout(ctx, srcs, element)

    return [DefaultInfo(
        files = depset([checkout]),
     )]

bst_element = rule(
    implementation = _bst_element_impl,
    attrs = {
        "srcs": attr.label(),
        "element": attr.string(),
    }
)
