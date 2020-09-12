module Main

import DoodleApp

infixr 1 //

||| In search of a convenient "OO style" method invocation syntax.
||| `obj // method arg1 arg2`
(//) : a -> (a -> b) -> b
(//) a f = f a

Point : Type
Point = (Double, Double)

State : Type
State = List Point

onTapDown : TapDownDetails -> State -> IO State
onTapDown d s = pure ((d.localPosition.dx, d.localPosition.dy) :: s)

onLongPressMoveUpdate : LongPressMoveUpdateDetails -> State -> IO State
onLongPressMoveUpdate d s = do
  let pos = d.localPosition
  putStrLn ("onLongPressMoveUpdate(" ++ show (pos.dx) ++ "," ++ show pos.dy ++ ")")
  pure s

onPaint : Canvas -> Size -> State -> IO ()
onPaint c _ [] = pure ()
onPaint c _ ((x0, y0) :: ps) = do
  path <- Path.new
  path // moveTo x0 y0
  traverse (\(x, y) => path // lineTo x y) ps
  paint <- Paint.new
  paint // setStyle PaintingStyle.stroke
  c // drawPath path paint

main : IO ()
main = runDoodleApp [] onTapDown onLongPressMoveUpdate onPaint
