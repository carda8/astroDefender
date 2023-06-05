// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flameex22/my_game.dart';
import 'package:flutter/material.dart';

class MyWorld extends ParallaxComponent<MyGame> {
  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData('game/background/dust.png'),
        ParallaxImageData('game/background/start_2.png'),
        ParallaxImageData('game/background/planets.png'),
        // ParallaxImageData('game/background/nebulaes.png'),
      ],
      fill: LayerFill.height,
      repeat: ImageRepeat.repeat,
      baseVelocity: Vector2(-5, 0),
      velocityMultiplierDelta: Vector2(1.15, 0),
    );
  }
}
