{ pkgs, dsl, ... }:
with dsl;
{
  plugins = with pkgs.vimPlugins; [
    imagine-nvim
  ];

  use.imagine.setup = callWith {
    path_to_executable = "/home/sarios/playground/python/dani-stable-diffusion";
    cmd = "python optimizedSD/optimized_txt2img.py";
    visual_selection_keymap = "<leader>i";
    image_viewer = "imv";
    config = {
      model_config = "--H 512 --W 768 --n_iter 1 --n_samples 4 --ddim_steps 50 ";
      prompt_extras = ", digital art";
    };
  };
}
