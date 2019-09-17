// log stream --process Phoenix
const modal = Modal.build({ text: "hmm...", weight: 15 });
const screenFrame = Screen.main().frame();
const modalFrame = modal.frame();
modal.origin = {
  x: screenFrame.x + (screenFrame.width - modalFrame.width) / 2,
  y: screenFrame.y + (screenFrame.height - modalFrame.height) / 2
};

const centerMouse = new Key("0", ["alt"], () => {
  const frame = Window.focused().frame();
	const center = {
		x: frame.width / 2 + frame.x,
		y: frame.height / 2 + frame.y
	};
  return Mouse.move(center);
});

const defaultProfileKey = new Key("escape", [], () => {
  defaultProfileKey.disable();
  Task.run(
    "/bin/sh/",
    [
      "-c",
      `'/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --select-profile 'Default profile'`
    ],
    () => {
      modal.close();
    }
  );
});

defaultProfileKey.disable();

const triggerNav = new Key("r", ["alt"], () => {
  defaultProfileKey.enable();
  modal.text = "nav";
  Task.run(
    "/bin/sh/",
    [
      "-c",
      `'/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --select-profile 'AmethystNav'`
    ],
    () => {
      modal.show();
    }
  );
});

const triggerMod = new Key("f19", [], () => {
  defaultProfileKey.enable();
  modal.text = "mod";
  Task.run(
    "/bin/sh/",
    [
      "-c",
      `'/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --select-profile 'AmethystMod'`
    ],
    () => {
      modal.show();
    }
  );
});

const triggerNav2 = new Key("f18", [], () => {
  defaultProfileKey.enable();
  modal.text = "nav";
  Task.run(
    "/bin/sh/",
    [
      "-c",
      `'/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --select-profile 'AmethystNav'`
    ],
    () => {
      modal.show();
    }
  );
});
