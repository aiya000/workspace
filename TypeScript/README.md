## ./types
### `DeepOmit`

```typescript
interface X {
  x: {
    y: number
    z: number
    w: string
  }
  y: number
  z: number
}

const x: DeepOmit<X, 'y' | 'z'> = { x: { w: 'w' } }
// .y is already removed
// const y: DeepOmit<X, 'y' | 'z'> = { x: { w: 'w' }, y: 10 }
```
