# FIX-RT-PAPER-HE-21 — verified explanatory corrections

Codex — `codex-5ebb6f`; issue #5527; 1 October 2026.
Both findings in `RT-PAPER-HE-21.result.json` are confirmed by
`RT-PAPER-HE-21.review.json`, including the verifier's additional instruction
about gap G3. Both are applied to the extraction and reader. Independent
`REV-FIX-RT-PAPER-HE-21` review remains pending.

## RT-PAPER-HE-21/1: shrunkenness need not survive, but singularity does not force failure

Replaced E1's universal claim and its embedded review explanation by the
existential failure of preservation. Reworded G3's repeated universal claim,
corrected `validation.mathematicalChecks`' old absolute-value argument, and
replaced the reader's E1 explanation. Kept the valid negative construction,
added the nonzero full-support positive construction, and preserved E1's gap
verdict, GHN15 Theorem A alternative and every item including /119–/122.
Regularity is not added as a hypothesis. This corrects the extraction's
argument; it does not refute He21's conclusion.

He21 **published p.5** explicitly uses translation by **minus** the coweight
and removes `(-1,0)` strips for **positive** roots. Its §5.4 construction is
on **pp.10–12**, and §6.3's seed citation is on **p.14**. The corresponding
arXiv locators are **pp.5–6,10–11,13**. He15 arXiv v3 **p.37, Theorem 2.27**
requires a shrunken input, a simple group and a basic class before asserting
its criterion. GHN15 **printed p.649, Theorem A** instead tests all alcoves
for Levi obstructions. It does not automatically discharge G3: one must
verify that obstruction criterion or complete the restricted class-polynomial
route and transport. The shrunken Theorem B is not a replacement.

In split adjoint A₂, σ=1, put

```
base alcove: u<0, v<0, u+v>−1
s₁(u,v)=(-u,u+v); s₂(u,v)=(u+v,-v)
t^(m,n)(u,v)=(u-m,v-n)
```

The positive example uses `λ=2ω₂^∨=(0,2), x=s₁, y=s₂`.
Finite Weyl lengths give `J={s₂}`, `ρ_J^∨=(0,1)`, `J′={s₁}` and
`η(w)=s₂s₁=x′z` with `x′=s₂∈W₀^{J′}`, `z=s₁`. The construction gives

```
λ−ρ_J^∨+(x′)^−1ρ_J^∨ = (0,1)+s₂(0,1) = (1,0)
γ=ω₁^∨=(1,0); K={s₂}; y′=1
a=s₁*s₂=s₁s₂  (length-additive, hence the Demazure product)
w(u,v)=(-u-v,u-2)
(a t^γ)(u,v)=(1-u-v,u-1)
```

`t^λs₂` has all three positive-root coordinates negative and affine length
3, while `t^λ` has length 4. Both simple left multiplications increase
length, verifying the required left-minimal representative. Both `η(w)`
and `a` have full support. On the open alcove the positive-root intervals are:

| case | α₁ | α₂ | α₁+α₂ | shrunken |
|---|---|---|---|---|
| positive input | (0,1) | (−3,−2) | (−2,−1) | yes |
| positive output | (1,2) | (−2,−1) | (0,1) | yes |
| retained negative input | (−2,−1) | (1,2) | (0,1) | yes |
| retained negative output | (1,2) | (−1,0) | (1,2) | no |

The positive output has nonzero singular `γ` but meets no critical strip.
Here `a(α₂)=−(α₁+α₂)`: changing to its positive orientation changes
`(-1,0)` into the allowed `(0,1)`. The discarded sign caused the old argument.
The positive example also preserves κ: `(m+2n) mod 3` is 1 for both
`λ=(0,2)` and `γ=(1,0)`.

The retained negative example is `λ=ω₂^∨=(0,1),x=s₂s₁,y=1`.
It has `J=∅,J′={s₁},x′=s₂,z=s₁,γ=λ,y′=1,a=s₁s₂`.
The input is `(v−1,1−u−v)` and the output is `(1−u−v,u)`.
The fourth row above still demonstrates failure of preservation and supports
the gap verdict. Neither example proves emptiness of the basic seed.

## RT-PAPER-HE-21/2: retain the semisimple scope of the torsion-kernel criterion

E13 and its embedded review now attribute the kernel formula and equivalent
injectivity criterion **only to semisimple G**, as the erratum's p.2 does.
The reader's inherited explanation is qualified the same way, and both files
include the split GL₂ regression. The known erratum, the general componentwise
comparison of Proposition 0.0.1 and the separate injectivity hypothesis in
item /104 stay. No source issue is added against the erratum.

The author erratum **p.1, Proposition 0.0.1** assumes
`char(k)∤|π₁(G_ad)|` for its componentwise flag isomorphism and adds
component-map injectivity for the global immersion. Its **p.2** begins
“Assume that G is semisimple.” Under this scope it identifies

```
ker(π₀(Flag) → π₀(Flag_ad)) ≅ X_*(T)_{Γ,tors},
```

so injectivity is equivalent to torsion-free coinvariants. In split GL₂,
`X_*(T)_Γ=ℤ²` is free, yet the component map is
`π₁(GL₂)=ℤ→π₁(PGL₂)=ℤ/2`, reduction modulo 2, with kernel `2ℤ`.
The quotient `ℤ²/ℤ(1,−1)` is ℤ via the sum map; `(1,−1),(0,1)`
form an integral basis. The central cocharacter `(1,1)` represents component
2, which is nonzero but maps to zero. Taking residue characteristic 3 also
satisfies the proposition's characteristic condition, since `|π₁(PGL₂)|=2`.
The reductive extension of the torsion-free criterion is therefore false.
He21's simple-group application and E6's adjoint-descent obligation remain.

## Provenance and historical review

Fresh public downloads were read at the locators above, using text extraction
and page images for He21 published p.10 and erratum p.2. The erratum was read
in full; the other documents were read only at the indicated sections.

| document and reading | SHA-256 |
|---|---|
| [He21 published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), pp.5,9–12,14 | `350e7a4d5d7e3effb8ec6a47fca66fb21d93c0a3f67415707d77ad9d5bfcbb72` |
| [He21 arXiv](https://arxiv.org/pdf/2001.03325), pp.5–6,9–11,13 | `818873a568bf37ec0b336cb12bd6822879ca369865cceb332ba06b95910989a3` |
| [He15 arXiv v3](https://arxiv.org/pdf/1511.01386), pp.37–38 | `f6170c52ce24599a5b1b6d7991ae9c9b98a8be8e5cf8753b9a335e74d3fe3cdc` |
| [GHN15 published](https://www.numdam.org/item/10.24033/asens.2254.pdf), PDF pp.4–5 / printed pp.648–649 | `f0c94caa4855416b4c1949307ea8c4f382d3310f5b27a349216203f5c9d81e3e` |
| [GHN15 author erratum](https://www.esaga.uni-due.de/f/ulrich.goertz/pdf/Erratum-GHN.pdf), all 3 pages | `cf7efbf887e8202c7efd7590e2eebd85c93c89bea81c26fa39a80af8082399c0` |

Cambridge's per-download footer changes bytes. The fresh download was read
from the public publisher endpoint even though the web-reader fetch timed
out. The He15 comparison is explicitly to its arXiv text, as in E1's
existing attribution. `sourceVersions` records each fresh reading and
projects the unchanged historical He14 version records needed by E9–E11;
those are explicitly inherited and were not reread in this fix. This is not
a full extraction, a new errata search, a recollation of all fourteen findings,
or an independent review of this worker's own amendment.

E1/E13 retain the historical confirmation verdicts. Their original review
objects are preserved exactly in `reviewHistory`, while the amended reasons
name this fix and its author and state that independent fix review is pending.
The original extraction and review records elsewhere remain historical.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-HE-21.result.json`: pass.
- `python3 scripts/check_errata.py <PAPER-HE-21.json>` on the §18 projection of `sourceIssues` and `sourceVersions`: pass.
- `python3 research/blueprint/intake.py check-files` on exactly the three issue deliverables: pass.
- `git diff --cached --check`: pass.
- Independent exact affine-vertex arithmetic, finite A₂ Weyl enumeration,
  coset minimality, Demazure length additivity, κ and GL₂ quotient/kernel
  computations: pass.
- Structural comparison: all 134 item objects (including all library claims
  and 376 item edges), 11 routes, 13 prerequisites and their membership are
  unchanged; all 14 source-issue IDs/kinds/printed statements/corrections,
  known status and historical verdicts are unchanged. G3's planning
  obligations and /104's guard remain. No local absolute paths are committed.

A minimal reproducible part of the finite regressions is:

```python
V = [(0, 0), (-1, 0), (0, -1)]
def s1(p):
    u, v = p
    return (-u, u + v)
def s2(p):
    u, v = p
    return (u + v, -v)
def t(lam, p):
    return tuple(x - y for x, y in zip(p, lam))
def intervals(f):
    values = [(u, v, u + v) for u, v in map(f, V)]
    return tuple((min(p[i] for p in values), max(p[i] for p in values))
                 for i in range(3))
def shrunk(f):
    return all(hi <= -1 or lo >= 0 for lo, hi in intervals(f))
positive = lambda p: s1(s2(t((1, 0), p)))
negative = lambda p: s1(s2(t((0, 1), p)))
assert intervals(positive) == ((1, 2), (-2, -1), (0, 1))
assert intervals(negative) == ((1, 2), (-1, 0), (1, 2))
assert shrunk(positive) and not shrunk(negative)
assert shrunk(lambda p: s1(t((0, 2), s2(p))))
assert shrunk(lambda p: s2(s1(t((0, 1), p))))
# The central GL2 cocharacter has nonzero GL2 component, zero adjoint component.
z = (1, 1)
assert sum(z) == 2 and sum(z) % 2 == 0
```

No Lean file was written or compiled: this issue corrects a paper extraction
and its explanations, and names no suggested Lean deliverable.
