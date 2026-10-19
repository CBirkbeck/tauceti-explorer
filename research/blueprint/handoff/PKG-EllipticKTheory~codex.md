# Handoff: PKG-EllipticKTheory~codex (issue #10745)

Worker: Claude (session claude-7uajHc), 2026-10-19.

## Deliverables

- `research/blueprint/packages/EllipticKTheory/README.md` (about 155 KB): Summary, Scope and ownership,
  Conventions, Exact supplier contracts, How to read the build, Layers 1–8 with 60 `### k.n`
  subsections, each with at least three Checks, `### Examples` and `### Dependencies` per layer,
  Downstream consumers, References.
- `research/blueprint/packages/EllipticKTheory/Suggested.lean` (392 lines): `import Mathlib` plus
  eight `TauCeti.*` modules, one module docstring, `namespace TauCetiRoadmap.EllipticKTheory`.
- `research/blueprint/packages/EllipticKTheory/metadata.toml`: `topic = "math.KT"`.

## Inputs and coverage

The plan is the accepted packets `EllipticKTheory.json` (53 nodes, E.1–E.8), `EllipticKTheory--E.5.json`
(11 nodes) and `EllipticKTheory--E.6.json` (6 nodes). The stages `KU-curvek`, `KU-models` and
`KU-symbols` of the atlas roadmap are aggregation checkpoints of the original unit plan with no
mathematical content of their own, and have no section. Every API name and test name of the three
packets occurs in the README (checked by script), except three API items renamed to the Lean names
below.

| Plan node(s) | README |
|---|---|
| E.1/the-elliptic-curve-as-a-scheme | §1.1 |
| E.1/geometric-properties-of-the-curve, E.1/geometrically-integral-curve | §1.2 |
| E.1/regular-in-the-divisor-api-form | §1.3 |
| E.1/the-function-field-of-the-curve | §1.4 |
| E.1/points-and-group-law-comparison | §1.5 |
| E.1/isogenies-as-scheme-morphisms | §1.6 |
| E.2/K0-of-a-curve … E.2/K0-of-an-elliptic-curve (seven nodes) | §§2.1–2.7 in plan order (descent §2.5, ring structure §2.6) |
| E.3 (eight nodes) | §§3.1–3.8 in plan order |
| E.4 (six nodes) | §§4.1–4.6 in plan order |
| E.5/pullback-and-pushforward, E.5/elliptic-operation-comparisons | §5.1 |
| E.5/projection-formula-and-isogenies | §5.2 |
| E.5/class-of-the-pushed-forward-structure-sheaf, E.5/isogeny-rank-determinant-action | §5.3 |
| E.5/the-projective-line-and-the-projective-bundle-theorem, E.5/projective-line-finite-field-comparison | §5.4 |
| (new: inputs routed to no supplier, see below) | §5.5 |
| E.5/harder-finiteness, E.5/harder-elliptic-input-closure | §5.6 |
| E.5/geometric-elliptic-k-modules | §5.7 |
| E.5/elliptic-cohomology-frobenius-descent | §5.8 |
| E.5/finite-elliptic-k-descent | §5.9 |
| E.5/twisted-frobenius-kernel | §5.10 |
| E.5/positive-odd-elliptic-k-groups, positive-even-elliptic-k-groups, elliptic-k-group-orders, an-elliptic-curve-over-a-finite-field | §5.11 |
| E.6/the-regular-proper-model | §6.1 |
| E.6/existence-of-a-regular-proper-model | §6.2 |
| E.6/minimal-arithmetic-model | §6.3 |
| E.6/regular-models-linked-by-blowups | §6.4 |
| E.6/exists-locally-minimal-arithmetic-model | §6.5 |
| E.6/locally-minimal-terminal-model, E.6/minimality-local-criterion | §6.6 |
| E.6/unique-minimal-arithmetic-model, E.6/minimal-model-localisation | §6.7 |
| E.6/the-integral-part, E.6/model-independence | §6.8 |
| E.6/good-reduction-primes-impose-no-condition | §6.9 |
| E.6/vertical-residues | §6.10 |
| E.7/symbol-certificates | §§7.1–7.2 |
| E.7 (seven further nodes) | §§7.3–7.9 in plan order |
| E.8/the-completion-criterion | "How to read the build", second paragraph (the assembled interface, without process language) |
| E.8 worked examples (three) | §§8.1–8.3 |

## Notions planned here because no supplier plans them (§5.5)

Recorded so that the supplier plans can be pointed here, or the targets moved to the supplier when it
is packaged.

1. `BMS_functionField`: `SK_1(R) = 0` for `R` the coordinate ring of a smooth affine curve over a
   finite field (Weibel III.2.5.1, p. 195). KTheoryLowDegrees U.4/bass-milnor-serre plans only the
   number-field case.
2. `reciprocitySequence_exact`: exactness of `K_2(F_q(X)) → ⊕_x k(x)^× → F_q^× → 0`. Not planned in
   K2SymbolsBrauer T.4, which has only the reciprocity relation (accepted parent source issue E2 gives
   the coprime-degree proof used here).
3. `tameKernel_finite`: the tame kernel of a global function field is finite of order prime to `p`.
   K2SymbolsBrauer's T.5 packet (restructure entry R4) routes it to EllipticKTheory E.5. The proof here
   uses ArithmeticKTheory N.3 (finite generation, accepted nodes
   `N.3:finite-generation/proper-curve-finite-generation`), KTheoryFiniteLocalFields §3.4 (`K_2(F)[p] = 0`)
   and Bloch–Gabber–Kato from MotivicEtaleKTheory M.5d with `Ω²_F = 0`.
4. `geisserLevine`: Geisser–Levine (a)–(c) for fields of characteristic `p` (Weibel VI.4.7, p. 485).
   MotivicEtaleKTheory M.5d plans Bloch–Gabber–Kato and the `ℓ ≠ p` comparison only; its
   `mod-prime-motivic-comparison` node is for `ℓ ≠ char`. KTheoryFiniteLocalFields' package also cites
   MotivicEtaleKTheory for "Geisser–Levine's p-torsion", so when MotivicEtaleKTheory is packaged it
   should own (a)–(c) and import nothing from here; until then §5.5 is the owner.

## Supplier ids corrected while writing

- GeneralAlgebraicKTheory "K.1" (Q-construction, filtered colimits) is Layer 2 (§2.4
  `pi1QEquivExactK0`, §2.5 `KGroup`) and §3.2 (`KGroup.ofRing_colimit`); "K.3" (Serre localisation,
  dévissage, resolution) is Layer 4 (§§4.6, 4.8, 4.14).
- EtaleDualityAndPerverseSheaves "EDC.2:trace-purity" and "EDC.2:pairings" are Layer 0 (§0.3
  `curveTrace`, `curveH1Duality`; §§0.5, 0.7).
- ArithmeticGaloisRepresentations "R01.1" does not contain continuous cohomology of `Gal(F̄_q/F_q)`;
  replaced by ArithmeticGaloisDuality R02.2 (continuous Hochschild–Serre, the supplier
  DeligneWeightsAndPurity also uses for this) and ProfiniteCohomology Layers 10–11 (`Hⁱ(Ẑ, −)`,
  `cd_ℓ Ẑ = 1`).
- K3BlochGroups V.5 (`K_3(ℚ) ≅ ℤ/48`) is only imported there from ArithmeticKTheory N.5/N.7; the README
  uses the number only in Checks.
- SchemeKTheoryOperations S.k are its Layers k; sections cited: §§2.2–2.6, 3.3, 3.5–3.7, 4.5,
  5.1–5.2, 5.5, 6.8–6.11, 7.2, 7.6.

## Duplication removed against current TauCetiRoadmap main and Tau Ceti (a91d3aaf)

- The projective Weierstrass scheme with properness, smoothness, integrality, zero section, charts and
  variable changes is implemented in current Tau Ceti (`WeierstrassCurve.projModel`,
  `isProper_projModelOver`, `smoothOfRelativeDimension_one_projModelOver`, `isIntegral_projModel`,
  `Projective.ChartRing`, `awayEquivChartRing`). §§1.1–1.2 cite them; only the comparison of the `Z`
  chart with Mathlib's `W.toAffine.CoordinateRing`, geometric integrality, `H⁰` and the genus stay
  targets.
- `Cl(X) ≅ Pic(X)`: current Tau Ceti `classGroupAddEquivLineBundleClass` plus pinned
  `SchemeWeilDivisor.equivCartierDivisor`; §2.3 records only the composite.
- Riemann–Roch is JacobianChallenge Layer B's and the degree-zero pushforward is
  SchemeAndStackFoundations' `Chow.kPushforward`; §2.2 consumes both.
- The Hasse bound and the Tate module are cited from current Tau Ceti (`hasse_bound`,
  `free_tateModule`, `finrank_tateModule`) through EllipticCurves Layers 2–3.
- The torsion function `div f_T = n(T) − n(O)` is Tau Ceti's
  `exists_principal_zsmul_pointPlace_sub_infinity`; a Lean restatement was removed.
- Nothing in TauCetiRoadmap main plans algebraic K-theory of schemes or curves.

## Lean names that differ from the plan

`EllipticK.p_torsion_not_mem_twistedFrobeniusKernel` is
`eq_zero_of_mem_twistedFrobeniusKernel_of_char_smul` (proved);
`EllipticK.baseChange_mem_twistedFrobeniusKernel` is `baseChange_mem_twistedFrobeniusKernel_iff`;
`EllipticK.map_twistedFrobeniusKernel` is `map_mem_twistedFrobeniusKernel`. The even half of
`finiteFieldK_orders` is the headline `card_twistedFrobeniusKernel`. The README uses the Lean names.

## What the README could not support fully

- Geisser–Levine's own theorem number was not checked (the paper is not freely reachable); the locator
  is Weibel's statement and proof, Theorem VI.4.7, p. 485.
- Bloch's CRM Monograph 11 is not freely available and not in the cleared library; every use of it is
  also cited to Young's thesis Lemma 3.1 (free), or to Dokchitser–de Jeu–Zagier.
- The positive-genus theorems of Layer 6 (existence and uniqueness of the minimal model over `O_{F,S}`)
  are not typed: stating positive genus of an arbitrary curve over the fraction field needs a genus at
  the pins. The carrier `RegularProperModel`, `Hom`, `IsMinimal` and `Hom.subsingleton` are typed.

## Adversarial pass

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| `card_twistedFrobeniusKernel` (`#B_i = 1 − a q^i + q^{2i+1}`) | `i = 0`; `y² + y = x³ + x + 1` over `𝔽₂` (`a = 2`): 5, 25; `y² + y = x³ − x` over `𝔽₂` (`a = −2`): 13, 41; `y² = x³ − x` over `𝔽₃`: 28 | false at `i = 0` (prime-to-`p` part of `E(F_q)`), true for `i ≥ 1`; `D_i ≡ 1 mod p` | hypothesis `1 ≤ i` kept |
| `tameValue` convention | `{u, π}`, `{π, u}`, `{t, t² + 1}` at `V(t² + 1)` on `ℙ¹_ℚ` | `∂{t² + 1, t} = −i`, not `i` | §3.2 Check corrected to `{t, t² + 1}` |
| `tameValue_self`, `tameValue_minus_one` | simple zero, `ord = 0`, `ord = 2` | `(−1)^{a²} = (−1)^a` | none |
| `tame_last_point` | degree-two place on `36a1` (`{x − 1, −1}`) | fails without `deg P₀ = 1` | hypothesis kept |
| `blochCorrection` | `C = 0`; collisions among `(f_P, c_P)`; `O` outside the support of `f, g`; `11a3` values | true in all (multiplicativity of `tame` in the candidate; reciprocity at `O`) | none |
| `Hom.subsingleton` | `O` a field; empty generic fibre; non-open generic fibre | Mathlib's lemma needs only a dominant map, so true | docstring states the three inputs |
| `baseChange_mem_twistedFrobeniusKernel_iff` | rational 2-torsion on `y² = x³ − x` over `𝔽₃`, `i = 1` | true (`q^i − 1 = 2`) | none |
| §2.6 ring structure | `(0, 1, O)²`, `([L] − 1)²` | square zero, not the product ring | none |
| §4.5 weights | `K_0(ℙ²)` | no integral decomposition (index 2) | Check kept |
| §5.3 determinant | `[3]`, separable degree two over `ℚ`, char 2 excluded | `L_[3]` trivial, `L_f` non-trivial for the 2-isogeny of `y² = x³ − x` | test renamed `two_isogeny_x3_minus_x` |
| §5.5 reciprocity sequence | `ℙ¹_{𝔽₂}`; curve without rational point | coprime-degree argument needed; Weil reciprocity alone gives only a surjection | stated |
| §5.9 descent | `n = 0` | degree-zero base change is an isomorphism by §2.5, `K_0` infinite | Check rewritten (`descent_K0_infinite`) |
| §6.1 regularity | `37a1` at 37 (`F(5, 18) = 222`), `11a1` at 11 (`F(5, 5) = 0`), `y² = x³ − 81x` at 3 | as stated | none |
| §6.1 Néron | `37a1` at 37: `15` is not a square mod 37 | non-split, `a_37 = −1` | none |
| §7.2 certificates | `11a3` tame values at `(0, 0)`, `(0, −1)`, `(1, 0)`, `(1, −1)`, `O` | recomputed by hand: `−1, −1, 1, 1, 1` | none |
| §7.5 torsion functions on `11a3` | norm to `ℚ(x)` of each function | `−x⁵`, `−x⁵`, `−(x − 1)⁵`, `−(x − 1)⁵` | none |
| §7.8 transfer on `y² = x³ − 2x` | values `1/4`, `−2√2`, transport `√2 ↦ −x₀` | product `x₀/2` | none |
| §8.1 DGJK `u = 4` | divisors of `v, w, h` and eight tame values against arXiv:2605.11100v1 pp. 29–31 | match | none |
| §8.3 DGJK `u = 1/3` | `4u` not an integer; model times 3; `ord_η v = 1` | vertical value `1/w` of infinite order | Check `bad_fibre_4u_integer` added |

## Locators checked

Against the public sources (SHA-256 equal to the packets' records): Weibel's combined draft (printed
page = PDF page − 8) at I.5.14–5.16, II.8.2.1, III.2.5.1, III.6.3, III.6.7, III.6.7.1, V.3.3.2 (p. 386,
corrected from the draft), V.3.11–3.12, V.6.6, V.6.12–6.12.1, VI.4.7, VI.6 opening, VI.6.1–6.7;
Scholl 1.1.1–1.1.7, 1.3.3, 1.3.6; Conrad Definitions 3.1, 3.8, Theorem 3.10, Remark 3.11, Corollary 4.7,
Example 5.3; Dokchitser–de Jeu–Zagier (3.1), (3.5)–(3.6), Remark 3.8, Construction 4.1, Proposition
4.3, Remark 4.14, Theorem 8.3; Dummigan–Golyshev–de Jeu–Kerr Proposition 10.2, Remark 10.3, Table 10.4;
Young Lemma 3.1 (p. 37), Theorem 3.3 (p. 41); Stacks tag 0BGP (Theorem 54.14.5).

## Checks run

- `lean-check research/blueprint/packages/EllipticKTheory/Suggested.lean`: exit 0, 14 warnings, all
  `declaration uses 'sorry'`; no other warning or error.
- `python3 scripts/check_sorry_data.py` on the Lean file: no sorry'd data.
- `python3 research/blueprint/intake.py check-files` on the three package files and this note:
  0 problems.
