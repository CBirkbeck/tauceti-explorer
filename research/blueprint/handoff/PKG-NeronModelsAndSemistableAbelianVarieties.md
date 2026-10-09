# PKG-NeronModelsAndSemistableAbelianVarieties — complete package

Worker session `cc-305b72` (Claude Code), 9 October 2026, branch `cc-305b72`. Short pipeline (no
issue, no GitHub interaction). Deliverables:

- `research/blueprint/packages/NeronModelsAndSemistableAbelianVarieties/README.md` (~138 KB)
- `research/blueprint/packages/NeronModelsAndSemistableAbelianVarieties/Suggested.lean` (~24 KB)
- `research/blueprint/packages/NeronModelsAndSemistableAbelianVarieties/metadata.toml`
  (`topic = "math.AG"`)
- this note

## Inputs and how they were folded

Base packet `NeronModelsAndSemistableAbelianVarieties.json` (78 nodes over the six stages
R11.1–R11.6; accepted review of 2026-10-05, with its six source issues E1–E6), its reader, its
suggested file (the R11.1 abstract prefix only: mapping property, marked model, extension,
weak model), and the atlas stage descriptions. The README is written in the TauCetiRoadmap form
(prose per target with API lemma names and `**Checks.**` bullets; six layers, each with Examples
and Dependencies; Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, Downstream consumers, References). The six source issues are stated at the claims they
affect (the corank misprint in 3.5, the invalid finite-level inference in 3.8, `dim X` in 6.10,
the toric subscript in 6.12, the withdrawn exactness in 2.5/6.2, `J` vs `X` in 6.14) and in the
References, without reference to the review.

## Duplication audit (Tau Ceti a91d3aaf and the current upstream roadmaps and packages)

No exact duplicate of a target exists in the Tau Ceti library. The following targets of the
packet were **removed** and are now citations in "Scope and ownership":

| Packet node | Now cited as |
|---|---|
| R11.4/bgw-brauer-descent | SchemeAndStackFoundations T354 (Picard–Brauer sequence) and T355(i) (rational divisor classes on hyperelliptic curves, the target that package moved down from R11.4) |
| R11.5/conductor-import (the definition) | ArithmeticGaloisRepresentations R01.3 (Artin/Swan conductor of a Weil–Deligne representation) and R01.6; only ℓ-independence, duality and isogeny invariance remain, as 5.4 |
| R11.5/local-euler-polynomial (the definition) | ArithmeticGaloisRepresentations R01.6 (local Euler factor of an abelian variety) and R01.2; only the semistable description, ℓ-independence and integrality at bad places remain, as 5.6 |
| R11.5/elliptic-local-polynomial | ArithmeticGaloisRepresentations R01.6 (comparison with Mathlib's `WeierstrassCurve.localPolynomial`) |
| R11.6/equation-conductor-comparison | ArithmeticGaloisRepresentations R01.3 (Ogg's formula in every residue characteristic, which consumes 2.7, 2.8, 2.10) |
| R11.6/unramified-three-torsion-at-two | an instance of 3.10 (`N = 3`, `k = 𝔽₂`); kept as the worked example in Layer 6 |
| R11.1/differential-lattice (the definition `e^*Ω¹` and translation invariance) | SchemeAndStackFoundations T361; the rank, generic, localisation, determinant and base-change statements remain, as 1.11 |
| R11.2/elliptic-filtration (`E₀`, `E₁`, `Ê(𝔪) ≅ E₁`) | EllipticCurves Layers 1 and 4, Tau Ceti `kerReduction`, `formalPointAddEquivKerReduction`; only `E₀(K) = M⁰(R)`, `E₁(K) = ker` and `E/E₀ ≅ Φ(k)` remain, as 2.6 |
| R11.4/intersection-component-quotient (the numerical side) | Tau Ceti `NumericalType.Pic`, `NumericalType.degree` (StableReduction Layer 6); only the comparison with `Φ_J(k)` remains, as 4.9 |
| R11.4/stable-family-picard (the Hodge-line clause) | JacobianChallenge Part II (downstream, which plans it); only the semi-abelian `Pic⁰` of a stable family remains, as 4.15 |
| R11.4/picard-zero (relative Picard sheaf, representability, `Pic^τ`) | AlgebraicModuliForArithmeticGeometry T527, T539, T543 instead of the packet's JacobianChallenge Layer D (field only) |
| R11.2/component-group (representability of the quotient) | ReductiveGroupsPartII RG2.3.1 (quotients over a base of dimension ≤ 1); finiteness, étaleness and Galois descent remain, as 2.2 |
| R11.2/toric-character (character lattices and Galois action) | ReductiveGroups Layers 4 and 7, Tau Ceti `geometricCharacterGroup`, `characterLatticeFunctor`; model functoriality remains, as 2.4 |
| R11.4/bgw-generalized-jacobian (norm-one torus) | ReductiveGroupsPartII RG2.0a `NormTorus.normOne`; the sequence remains, as 4.11 |
| R11.5/neron-ogg-shafarevich (forward direction) | ArithmeticGaloisRepresentations R01.6 (good-reduction Frobenius polynomial); the converse remains, as 5.1 |

Variants kept with a one-clause difference (listed in Scope): marked Néron model vs Tau Ceti
`Model`; marked extensionality and uniqueness vs `ext_of_genericFiberι_eq`,
`Model.subsingleton_iso`; the component group vs `componentGroupScheme` (affine, algebraically
closed); the cycle lattice `H₁(Γ, ℤ)` vs StableReduction's `firstBetti`; the semistable predicate
vs `WeierstrassCurve.IsSemistable`.

Part II: no target here duplicates a Part II node. The one-node hyperelliptic curve (4.10) is now
defined by its equation `z² = y² f(x, y)` in `ℙ(1, 1, g + 2)` with its explicit normalisation,
so that it no longer needs Part II's Ferrand pinching (the packet's upward citation
`NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence`); Part II's quadratic
pinching chain (G.1) is for genus-one fibres and is not restated.

## Moved-down notions and citation rewrites

- `PadicHodgeTheory:R06.6` (tier 13, cited by R11.5/padic-comparison-import and by the stage
  link): stated here as 5.3 — the period rings `B_cris ⊂ B_st ⊂ B_dR`, the functors `D_cris`,
  `D_st`, `D_dR`, and the comparison "good reduction ⇒ crystalline, semistable ⇒ semistable" for
  `V_p(A)`, with sources (Fontaine 1982 and 1994, Coleman–Iovita 1999, BCGP21 Prop. 2.8.1). This
  is the one moved-down notion. The maintainer should note that PadicHodgeTheory's own node
  `R06.6/semistable-reduction-semistable` cites our 3.1 for the predicate, so the two roadmaps
  now both state the comparison; if the order is later revised, 5.3 should become a citation
  again.
- `ShimuraCompactifications:C4` (the packet's `G-semiabelian-prefix` request): semi-abelian
  varieties over a field are defined in 3.1 and the `1`-motive carrier `[Y → G]` is data of 3.12;
  no citation to C4 remains.
- `NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence`: removed as above.
- The packet's `tauceti:TauCetiRoadmap/...` layer anchors are written as "EllipticCurves
  Layer 4", "StableReduction Layer 6", "JacobianChallenge Layer D", etc.; `AdicSpacesPartII:F0`
  is cited through SchemeAndStackFoundations SF.4b (lower tier), with F0's R2.71–72 mentioned.

## Boundaries the maintainer may want to settle

- The geometric Kodaira dictionary (2.8): StableReduction's introduction (README lines 269–271)
  says its Layer 5 "supplies the missing comparison with minimal regular models and Kodaira
  fibre geometry", but Layer 5 lists no such target; the packet's upstream note (RT-1/21) and
  Part II's intro place the dictionary at R11.2. The README states it here on top of
  StableReduction Layer 5 and says so. ArithmeticGaloisRepresentations R01.3 (Ogg's formula)
  requires 2.7, 2.8 and 2.10 from us.
- StableReduction Layer 7's curve–Jacobian criterion needs 1.7, 3.1 and 4.4 (the packet's
  upstream note); it is listed under Downstream consumers.
- Formal schemes are planned by both AdicSpacesPartII F0 and SchemeAndStackFoundations SF.4b;
  3.11 cites SF.4b.

## Lean

`Suggested.lean` is in the TauCetiRoadmap form: `import Mathlib` plus
`TauCeti.AlgebraicGeometry.Curves.StableReduction.Picard.Basic`, one module docstring, namespace
`TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties`, layer section comments, `theorem`
throughout, docstrings with sources, `example` tests, two `#check` pins (`TauCeti.NumericalType.Pic`,
`.degree`), no `#print`/`#eval`, no catalogues. Content: the R11.1 abstract prefix (mapping
property, marked model, `extend`, `unique_iso`, weak model, `ofNeronModel`); the ℤ/n fixed-point
count of negation (Layer 2); the ramified Tate component map `ℤ/n → ℤ/en` (Layer 3); the
boundary map, cycle lattice and weighted edge form of a multigraph, the adjoint, cokernel and
discriminant pairing of an integral lattice pairing, and `rankOne n` (Layer 4); the 2-group
fixed-vector lemma and the `GSp` order bound (Layer 6). A closing comment names the untyped
statements. Removed from the earlier suggested file: the `#check` name catalogue and the 850-line
omission catalogue; removed during the duplication audit: a matrix-level `ker d / im I` (now the
pinned `NumericalType.Pic`) and a local-Euler-polynomial definition with Mathlib
`localPolynomial` lemmas (now ArithmeticGaloisRepresentations' targets).

`lean-check research/blueprint/packages/NeronModelsAndSemistableAbelianVarieties/Suggested.lean`
(the swarm tool, Tau Ceti f790474 + Mathlib 082e2d3): **exit 0, 0 errors, 85 warnings, all
`declaration uses sorry`**; the only other output is the two `#check` lines. (The earlier
suggested file also elaborated at the pins: exit 0, 53 sorry warnings.)

`python3 research/blueprint/intake.py check-files` on the three package files: 0 problems. No
`/home/` path occurs in any deliverable.

## Adversarial mathematics pass

| Statement / definition | Instances tried | Result and change |
|---|---|---|
| 1.1 mapping property, `j = 𝟙 S` | degenerate base | holds for every object (pullback along the identity is an equivalence); kept as the degenerate check, with the warning that it carries no arithmetic content |
| 1.2 marked model vs lft models | `𝔾_m` over `ℚ_p` | lft Néron model fails `QuasiCompact`; stated in 1.2, 1.7 and the Layer 1 examples |
| 1.11 `ω_M` free? | `Pic R ≠ 0` | not free in general; kept finite projective, negative control `projective_test` |
| 2.2 `Φ_E(k)` nonsplit, `card_fixedPoints_neg` | `n = 1, 2, 4, 5, 0` | `n = 1 → 1`, `n = 2 → 2`, `n = 4 → 2`, `n = 5 → 1`; `n = 0` gives `1` while the formula would give `2`: hypothesis `0 < n` kept, negative-control example added |
| 2.3 Chevalley `L = T × U` | imperfect `k` | only over perfect `k` (hypothesis); "over `k^sep`" corrected to "over `k`" |
| 2.6 `E/E₀ ≅ Φ(k)` | `k = ℝ`-type perfect fields | surjectivity needs `H¹(k, M⁰) = 0`; restricted to finite `k`, injectivity only otherwise |
| 2.8 component counts and multiplicities | all ten types | `I₀*`: 5, `Iₙ*`: `n + 5`, `IV*/III*/II*`: 7/8/9; multisets checked against `Ẽ₆, Ẽ₇, Ẽ₈` |
| 2.9 `Iₙ*` groups | `n` even/odd | `(ℤ/2)²` vs `ℤ/4`; `I₃*` added as a check |
| 2.10 wild discriminants | `char k = 2`, type `II*` | "`= 11`" overclaimed a value; changed to "`> 10`" |
| 3.4 `componentMap n e` | `(n, e) = (1, 2), (n, 1), (2, 0)` | `ℤ/1 → ℤ/2`; identity for `e = 1`; zero map for `e = 0`: hypothesis `0 < e` for injectivity, negative control added |
| 3.5 ranks | `g = t = 1`; surface `t = a = 1` | `1 ⊂ 1 ⊂ 2` with corank 1 (source misprint corrected); `1 ⊂ 3 ⊂ 4` |
| 3.10 full level | `N = 2` | the stated non-example was wrong (it was a Tate curve, which is semistable anyway); replaced by a ramified quadratic twist of a good curve: additive reduction with trivial inertia on `E[2]` |
| 3.10 / Layer 6 example | `q = 8` over `ℚ₂`, `N = 3` | `E_q[3] = ⟨ζ₃, 2⟩` unramified, reduction multiplicative: semistable, not good |
| 4.3 Betti formula | empty vertex set; two vertices, no edge | `0 + 0 ≠ 0 + 1` and `0 + 2 ≠ 0 + 1`: `[Nonempty V]` added to the Lean signature, connectedness kept, negative control added in README and Lean |
| 4.3 cycle lattice | loop; tree; double edge | ranks `1, 0, 1`; a simple-graph model would give `0` for the double edge |
| 4.5–4.7 `rankOne n` | `n = 1, 0` | cokernel trivial for `n = 1`; `ℤ` (infinite) for `n = 0`, so nondegeneracy/finiteness are genuine hypotheses of the discriminant pairing; negative control added |
| 4.8 discriminant values | `(r + n)s/n` | differs from `rs/n` by the integer `s`; `n > 0` carried on every division |
| 4.9 intersection matrices | tree; `I₂`; `I₀*` | `0`, `ℤ/2`, `(ℤ/2)²`; `I·m = 0` verified for the `D̃₄` matrix with `m = (2,1,1,1,1)` |
| 4.11 Hilbert 90 | split `D = K × K` | torus `𝔾_m`, `H¹ = 0`; nonsplit `K^×/N(D^×)` |
| 4.12 orders | `g = 1` | `8` and `4` |
| 4.13 odd factors | irreducible `f` | "`g` odd" was wrong: irreducible `f` of even degree has no odd factor for every `g`; corrected |
| 5.5 conductor | `t = 0`; elliptic multiplicative; surfaces | `0`, `1`, `t` |
| 5.6 `P_v` | split/nonsplit Tate, additive | `1 − T`, `1 + T`, `1`; arithmetic Frobenius would give `1 − qT` |
| 5.7 residual conductor | `ℓ ∣ ord(q)` | residual conductor `0` vs characteristic-zero `1`; hypothesis `ℓ ∤ #Φ` kept |
| 6.1 adjunction | isogeny `E_q → E_{q^m}` | `n·m = mn` on rank-one lattices |
| 6.4 isogeny differentials | degree-`p` isogeny reducing to Frobenius | `f^*ω ≡ 0 mod p`; wording made precise |
| 6.13 `2`-group fixed vector | order-`3` group on `𝔽₂²` | no fixed nonzero vector: negative control added in README and Lean |
| 6.14 `GSp` bound | `g = 0`, `N = 0` | Lean states `card H < N^{4g²} + 1` (holds for `g = 0`); README keeps Yuan's `g > 1` strict bound; `N = 0` excluded by `1 < N` |
| Generality README = Lean | every typed statement | the Lean carriers are exactly the README's: `Over S` with arbitrary `j`; `ℤ/n` with `0 < n`; arbitrary finite multigraphs; arbitrary `ℤ`-modules for the pairing (README: free lattices, a special case) |

## Open points for the maintainer

- 5.3 is a moved-down notion that mathematically belongs to a `p`-adic Hodge theory roadmap;
  it is stated here only because PadicHodgeTheory is above this roadmap in the order.
- The packet's `acceptance-examples` node is the Layer 6 Examples paragraph, not a target.
- Several README Checks (Kodaira configurations, intersection matrices on `NumericalType`,
  Picard examples) have no `example` in `Suggested.lean` because their carriers are not typed;
  they are listed in the closing comment of the Lean file.
