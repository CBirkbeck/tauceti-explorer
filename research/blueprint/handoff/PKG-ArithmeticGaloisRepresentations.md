# PKG-ArithmeticGaloisRepresentations

Worker session `cc-a577f7` (Claude Code), 2026-10-09, branch `cc-a577f7`. Short-pipeline package job: one sitting, from the accepted packet `research/blueprint/packets/ArithmeticGaloisRepresentations.json` (327 nodes: 30 definitions, 28 constructions, 172 theorems, 84 lemmas, 9 comparisons, 4 applications; stages R01.1–R01.6 and G7), its reader, its suggested file and the atlas stage descriptions.

## Deliverables

`research/blueprint/packages/ArithmeticGaloisRepresentations/`:

- `README.md` — the roadmap in TauCetiRoadmap prose form: introduction, scope and ownership (with the deferrals found by the duplication sweep), conventions, exact supplier contracts (Mathlib; Tau Ceti; `TauCetiRoadmap.LocalFieldsRamification`, `ClassFieldTheory`, `NumberFieldArithmetic`, `Chebotarev`/`ArithmeticDirichletSeries`, `RepresentationTheory`, `EllipticCurves`/`StableReduction`/`JacobianChallenge`, `ProfiniteCohomology`/`ReductiveGroups`; lower-tier programme roadmaps), how to read the build, then seven layers in build order (1 = R01.1 continuous representations and integral models, 2 = R01.2 local objects and Weil–Deligne representations, 3 = R01.3 conductors, 4 = R01.4 residual images and oddness, 5 = R01.5 recognition by Frobenius polynomials, 6 = R01.6 Tate modules, 7 = G7 dimension-general API), each with `### k.n` prose subsections, definitions with API and `**Checks.**` bullets, theorems with exact hypotheses and source locators, `### Dependencies`; downstream consumers; references. Size: see the Checks section.
- `Suggested.lean` — the roadmap's existing suggested file (880 KB, 563 theorems, 293 examples) joined and transformed into TauCetiRoadmap form: `import Mathlib` plus the four Tau Ceti abelian-variety modules, one module docstring, the whole file under `namespace TauCetiRoadmap.ArithmeticGaloisRepresentations` with the sub-namespaces `ContinuousRep`, `GaloisRep`, `GaloisLattice`, `WeilDeligneRep`, `Conductor`, `ResidualImage`, `PolarizedRep`, `SimilitudeGroup`, `GSp4Rep`, `CHTGroup`, `LocalWeil`, `G7`; layer section comments in README order; `lemma` → `theorem`; the planning residue removed (the 110-entry declaration index, node ids in section headers, packet wording). The geometric Tate-module block of the suggested file (155 declarations and 26 examples on the `AbelianVariety` carrier, never elaborated by any earlier pass) does not type at the pins (`λ` used as a variable name, unknown `Hom.toOverHom` and `CategoryTheory.End.toHom`, stuck universe constraints, the supplier objects dual / polarisation / finite pairing absent): it was removed and its declarations are listed by name in the closing comment of `Suggested.lean`; the README states all of Layer 6. A closing `Witness` namespace holds four negative-control / convention-witness `example`s from the adversarial pass, followed by nine Layer 2 witnesses (Weil–Deligne relation on `Sp(n)`, Jordan-block non-example, imperfect-field and `q = 1` controls, dual sign, tame-character conjugation, `ℓ = p` exclusion, `θ_{p−1} = χ̄_p`) and ten Layer 7 witnesses (`p ∣ n` adjoint splitting failure, `2 ∉ Aˣ` tensor-square failure, rank-zero determinant identity, polarisation sign, adequacy and enormousness controls).
- `metadata.toml` — `topic = "math.NT"`.

## Lean check

`lean-check research/blueprint/packages/ArithmeticGaloisRepresentations/Suggested.lean` (the swarm tool: `lake env lean` in the shared build at Tau Ceti f790474 + Mathlib 082e2d3; the file imports Mathlib and the four Tau Ceti abelian-variety modules): exit 0, 960 `declaration uses sorry` warnings, no errors, no other warnings. Seven runs in all: the first two, with the geometric block present, stopped at the 100-error cap inside that block (everything before it elaborated with sorry only); the third after its removal, the fourth after adding the witness examples, the sixth after adding the Layer 2 witnesses (the fifth had one instance failure and one misplaced `end`, both fixed) and the seventh after adding the Layer 7 witnesses were clean.

## Duplication sweep (current TauCeti a91d3aaf and current TauCetiRoadmap) — removals and citations

The sweep searched by object (structure fields, operators, hypotheses) with positive control `absoluteGaloisGroupRestrictEquiv`. Targets that exist are deleted from the layers and cited under "Scope and ownership" / the supplier contracts:

- Layer 1, `TateTwist.zlOne` (ℤ_ℓ(1) with its Galois action) → Tau Ceti `PadicTateTwist`, `PadicTateTwist.galoisRepresentation` (`TauCeti/RingTheory/RootsOfUnity/PadicTateTwist.lean`); kept: the twist `M(n)` of a continuous representation and the comparison `TateTwist.zlOne_eq_padicTateTwist`.
- Layer 1, Ribet's lemma `GaloisLattice.ribet_nonsplit_lattice` → IntegralHeckeAndGaloisDeterminants `ribet_lattice`.
- Layer 1, integral models and residual representations for split reductive Ĝ (former 1.13) → IntegralHeckeAndGaloisDeterminants `reductive_integral_model`.
- Layer 2, local inertia, wild inertia and arithmetic Frobenius lifts → Tau Ceti `inertiaSubgroup`, `wildInertiaSubgroup` (`TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean`, `WildInertia.lean`), `IsArithFrobeniusLift`; kept: the global decomposition, inertia and wild inertia groups at a place of a number field inside `G_F` (no library object) and their comparison along the local embedding.
- Layer 2, the ℓ-adic cyclotomic character and its local form → Mathlib `cyclotomicCharacter`, Tau Ceti `localCyclotomicCharacter`; kept: Dirichlet characters as Galois characters and the lemmas about the cyclotomic character.
- Layer 2, the ℓ-adic tame character `t_ℓ` → Tau Ceti `inertiaPadicTameCharacter` (`TauCeti/NumberTheory/LocalField/Tame/PadicCharacter.lean`), with `inertiaTameCharacter`, `quotientWildInertiaSubgroupEquiv`; kept: its conjugation and restriction formulas and the fundamental characters (no library object).
- Layer 3, the ramification filtration, Herbrand functions and upper numbering → Tau Ceti `lowerRamificationGroup`, `herbrand`, `upperRamificationGroup` (cited through `TauCetiRoadmap.LocalFieldsRamification` layer 3); kept: the absolute upper filtration `G_K^u` and the intersection formula for open subgroups, which that roadmap does not state.
- Layer 6, the Tate module of an elliptic Weierstrass curve with its continuous Galois representation, Weil pairing and determinant → Tau Ceti `TateModule`, `tateModuleGaloisRepresentation`, `continuous_tateModuleGaloisRepresentation_apply`, `tateModuleWeilPairing`, `det_tateModuleGaloisRepresentation` (`TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/*.lean`); kept: the abelian-variety Tate module in every dimension and `tateModule_weierstrass_comparison`, which identifies it with the library object in dimension one.
- Layer 7, symmetric, exterior and tensor powers and tensor induction of abstract representations → Tau Ceti `Representation.symmetricPower`, `Representation.exteriorPower`, tensor powers, `tensorInducedRepresentation`; kept as refinements adding the module topology, joint continuity, finite projectivity and rank.
- Found nowhere (sweep result, patterns recorded in the sweep): Weil–Deligne representations, Frobenius semisimplification, Grothendieck's monodromy theorem, Artin and Swan conductors of representations, `N(ρ̄)`, Ogg's formula, Dickson's images and oddness, Chebotarev for infinite extensions, polarised/adequate/enormous images, Hodge–Tate lifting; pseudocharacter reconstruction is IntegralHeckeAndGaloisDeterminants and is cited.

Kept with a one-clause statement of the difference: the continuous symmetric, exterior and tensor powers and the continuous tensor induction of Layer 7 (Tau Ceti's `Representation.symmetricPower`, `exteriorPower`, tensor powers and `tensorInducedRepresentation` are for abstract representations; the roadmap adds finite projectivity, rank, the module topology, joint continuity and base change); the classical Brauer–Nesbitt theorem of Layer 1 (IntegralHeckeAndGaloisDeterminants states the determinant-form reconstruction over an algebraically closed field, whose proof consumes the classical statement, so the classical statement cannot cite it).

## Moved-down notions (tier rule: this roadmap is upstream tier 7)

- From LefschetzPencilsAndVanishingCycles LPV.1 (tier 10): the pure linear-algebra monodromy filtration of a nilpotent endomorphism (existence, uniqueness, conjugation and scaling invariance) is a target of Layer 2 (monodromy filtration and purity).
- From NeronModelsAndSemistableAbelianVarieties R11.2 (tier 8): the smooth locus of the minimal proper regular model as the Néron model, the Kodaira configuration and component count per reduction symbol, and its validity in residue characteristics 2 and 3, are Layer 3 targets (`minimalRegularModel_smoothLocus`, `kodaira_configuration`, `kodaira_wild_comparison`). From R11.1: the good-reduction inputs of the Frobenius polynomial are hypotheses/targets in Layer 6.
- From AutomorphicLFunctionsAndLocalFactors AL.1 (tier 12): Tate's local ε-factors of quasi-characters, as far as the local-constant statement of Layer 2 needs them, are stated there.
- From ArithmeticGaloisDuality R02.4 (tier 8): Tate's vanishing `H²(G_F, ℚ/ℤ) = 0` is a Layer 7 target where projective lifting uses it.
- From PadicHodgeTheory R06.2 / P7 (tier 13): labelled Hodge–Tate weights of characters and tensor products, "Hodge–Tate characters are de Rham" and "zero Sen operator implies finite inertia" are Layer 7 theorem targets with their hypotheses.
- From FunctionFieldArithmetic FA.5 (outside the 94): function-field Chebotarev is a Layer 5 target (`functionField_chebotarev`).

## What the README could not support

- The packet's 38 source/proof gaps (unread sources such as Dickinson 2001 Lemma 42, Gan–Takeda Lemma 6.1, Thorne 2024 Lemma 7.3, the Cline–Parshall–Scott tables, the Magma computations of Boxer–Calegari–Gee–Pilloni, Serre's independence theorems, Saito's conductor–discriminant inputs, Brumer–Kramer Theorem 5.5) are stated in the README as theorems with their exact hypotheses and the locator of the statement; the README does not claim a proof route for them. The ramification filtration over a perfect infinite residue field is a standing hypothesis of Layer 3, not a supplied result.
- Size: the README is about 209 KB against the brief's 200 KB figure. Layer 7 (77 targets: the dimension-general API, 46 KB after two trimming passes) cannot go below ~45 KB without deleting hypothesis lists, check names or last locators, which the README form forbids; the front matter, references and the other six layers are already at or under their budgets. If the cap is to be kept, the clean split is a Part II consisting of Layer 7 alone ("dimension-general arithmetic API": powers, adjoints, polarisations, similitude groups, Zariski closures, adequate/enormous images, `GSp₄` conditions, Hodge–Tate lifting), which depends on Layers 1, 2, 4 and 5 and is consumed by the deformation, automorphic and potential-modularity roadmaps; the packager did not make that split.
- Layer 6 has no `example`s in `Suggested.lean` (see the Lean note); its checks are in the README only.
- The adversarial mathematics pass was run by the packager on the front matter and Layers 3 and 5, and by audit agents on the layers whose tables appear below; layers without a table were not audited in this sitting and must be audited before the PR.

## Checks

- `README.md`: 208,959 bytes; `Suggested.lean`: 701,581 bytes; `metadata.toml`: `topic = "math.NT"`.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems; no local filesystem paths.
- Residue grep over the README (packet, node, stage, `(removed)`, `T0nn`, field lists, node ids): no hits.
- Lean: see the Lean check section (exit 0, sorry-only).
- Own-words check (`verify.sh`, 12-word runs against the planning texts): 76 statement-type overlaps rewritten in place (README prose and Lean docstrings/section titles; no declaration, binder, statement or proof changed; lean-check rerun clean). Remaining overlaps are three paper titles in the References.

## Adversarial mathematics pass — tables

Statements checked, instances tried, result, change made (PACKAGE_BRIEF.md "Adversarial mathematics pass"). The front matter and Layers 3, 5, 6 were audited by the packager; Layers 1 (dedup only), 2, 4 (spot) and 7 by audit agents, each editing the layer prose in place. Negative controls are `**Checks.**` bullets named `<lemma>_not_<case>` in the README and `example`s in the `Witness` namespaces of `Suggested.lean`.

### Front matter (conventions, supplier contracts)

| Statement | Instances tried | Result | Change made |
|---|---|---|---|
| Weil–Deligne relation `r(w) N r(w)^{-1} = q^{deg w} N` (arithmetic lift of degree 1) | `Sp(2)`: basis `e₀, e₁`, `N e₁ = e₀`, `r(Φ) e₀ = q e₀`, `r(Φ) e₁ = e₁` | both sides equal `q e₀` on `e₁`; the inverse relation `q^{-1} N` fails | computed witness added to the Conventions bullet, with the equivalent `t_ℓ(gσg^{-1}) = χ_ℓ(g) t_ℓ(σ)` |
| Frobenius characteristic polynomial with arithmetic Frobenius | `ℤ_ℓ(1)` at `p` over `ℚ` | `X − p`; with a geometric lift `X − p^{-1}` | witness added |
| Local Euler factor with `Frob_v^{-1}` | `ℤ_ℓ(1)` at `p` | `(1 − p^{-1-s})^{-1}`, `L(ℚ_ℓ(1), s) = ζ(s+1)`; with arithmetic Frobenius one would get `ζ(s−1)` | witness added |
| `ContinuousRep → ContRepresentation` | `ℤ_ℓ` acting on discrete `ℚ_ℓ` by `(1+ℓ)^a` | forward map fine; converse false (kernel `{0}` not open) | negative witness added |
| Determinant through top exterior power | rank 0 (`⋀^0 M = A`), `ℤ_ℓ(1)` | `det = 1` on the zero module; `det ℤ_ℓ(1) = χ_ℓ` | degenerate instance added |
| `χ_ℓ` needs `char F ≠ ℓ` | `char F = ℓ` | Mathlib's `cyclotomicCharacter` is trivial there | hypothesis stated as never dropped |
| Tate twist and duality `M(1)^∨ ≅ M^∨(−1)`; Hodge–Tate weight `+1` | `ℚ_ℓ(−1)` weight `−1`; `H^1(E)` weights `0, 1` | consistent with `HT(χ_ℓ) = +1` | witnesses added |
| Weil-pairing determinant | `T_ℓ A`, `g = 1` | `e(gx, gy) = χ_ℓ(g) e(x,y)` gives `det = χ_ℓ^g`, not `χ_ℓ^{-g}` | sign witness added |
| Artin conductor `= codim V^{I} + Swan`; Weil–Deligne monodromy term | quadratic character of `ℚ_p(√p)/ℚ_p`, `p` odd (`a = 1`); `Sp(2)` of the Tate curve (`0 + 0 + (2 − 1) = 1`) | both give the known conductor exponents; made explicit that `V^{I}` in the monodromy term is the `r`-invariants (otherwise `Sp(2)` would give `1 − 1 = 0`) | clause and witnesses added |
| Ogg's formula `v(Δ) = f + m − 1`, `m` without multiplicity | `I₀^*` (`v(Δ) = 6`, `f = 2`, `m = 5`), `I_n` (`n, 1, n`), good reduction (`0, 0, 1`) | arithmetic checks; `m = 4` (Néron component group) would give `v(Δ) = 5`, false | witnesses added |
| Oddness `det ρ(c_v) = −1` | `ℤ_ℓ(1) ⊕ ℤ_ℓ` (odd), trivial rank two (even), coefficients `F_2` (`−1 = 1`: vacuous) | the rank-two predicate is vacuous over `F_2` | scoped to rings with `−1 ≠ 1`; the Layer 7 sign condition is the characteristic-two form |
| Conductors need `char A ≠ p` and finite wild image | `ℓ = p` | undefined (inertia image infinite, no `V^{G^u}` stabilisation) | already a standing hypothesis; unchanged |
| Supplier contracts promise an extension-free use of `artinMap(U_K^n) ↔ G_K^n` | — | the comparison is not in `ClassFieldTheory` layer 7 | named as a Layer 3 target in the contract |
| "How to read the build": Layer 3's elliptic comparison needs Layer 6 | — | forward reference | ordering stated explicitly |

### Layer 1

Not audited in this sitting; the reviewer must run the pass on this layer before the PR.

### Layer 2

| Statement | Instances tried | Result | Change made |
|---|---|---|---|
| `indecomposable_iso_tensor_special`: indecomposable ≅ r₀ ⊗ Sp(n), r₀ irreducible | Jordan block `r(F) = [[1,1],[0,1]]`, `N = 0` (indecomposable, not F-semisimple) | false without F-semisimplicity: r₀ would be 2-dim non-semisimple, and Sp(2) ⊗ 1 has `N ≠ 0`; the Lean signature carries `hss`, `hfin`, `1 < q` | prose now says "F-SEMISIMPLE indecomposable, q ≥ 2"; check `indecomposable_not_of_jordan` |
| `WeilDeligneRep` "over Ω of characteristic 0"; `frobeniusSemisimplification` "independent of F" | Lean structure has `[Field Ω]` only (`geometric_copy_fails` needs `q² ≠ 1` because `Ω = 𝔽₃, q = 2` is allowed); Ω = 𝔽_p(t) with minimal polynomial `(X^p − t)²` (no Jordan decomposition); `W = ℤ²` with infinite `r(ker deg)` (unipotent part depends on `F`) | generality mismatch both ways: Lean is more general than the prose for the structure, and more general than true for the Jordan decomposition and the independence | prose scoped to "any field in Lean; char 0 for `iso_smul_monodromy`, `ofEllAdic`; perfect for the Jordan decomposition; independence needs `r(I_K)` finite"; check `frobeniusSemisimplification_not_imperfect` |
| `grothendieck_monodromy`, `ofEllAdic` (ℓ = p) | `ρ = χ_p` on `G_{ℚ_p}`, ℓ = p: `χ_p(J)` open in `ℤ_p^×`, infinite and not unipotent on any open `J ⊂ I` | no nilpotent `N` exists; the layer's standing `l ≠ p` is load-bearing and Lean's `IsTameCharacter` encodes it | check `ofEllAdic_not_ell_eq_p`; prose notes `IsTameCharacter` encodes `q ≥ 2` and `ℓ ≠ p` |
| `ofEllAdic_iso_frobenius`: `F ↦ Fτ` conjugates by `exp((q−1)^{-1} t(τ) N)` | recomputed: `(Fτ)^n = F^n τ_n` with `t(τ_n) = t(τ)(q^n−1)/(q−1)` (using `t(F^{-k}τF^k) = q^k t(τ)`, `χ_ℓ(F) = q^{-1}`), and `ρ'(F^nσ)^{-1} N ρ'(F^nσ) = q^n N`, so `c(q^n−1) = (q^n−1)/(q−1)`; `τF` gives `q/(q−1)` | constants correct; denominator `q − 1` needs `q ≠ 1` | prose states `q − 1 ≠ 0` from `q ≥ 2` in `IsTameCharacter`; `a ∈ ℤ_ℓ^×` (Lean) vs `ℚ_ℓ^×` (roadmap) recorded |
| `iso_smul_monodromy`: `(V, r, N) ≅ (V, r, aN)` | `q = 1`, `r(F) = 1 + N`, `N ≠ 0`: the commutant of `r` is `Ω[N]`, which cannot rescale `N` | false for `q = 1`; Lean has `CharZero Ω`, `1 < q`, `hfin` | prose adds "char Ω = 0, q ≥ 2, r(I_K) finite"; check `iso_smul_monodromy_not_q_one` |
| `IsWeilNumber`, `IsPure` | `q = 1`: every root of unity is a Weil number of every weight; `(1, 0)` pure of weight `w` for all `w` | weight not determined for `q = 1`; Lean's `not_isPure_split` already carries `1 < q` | prose "q ≥ 2 for the weight to be determined"; check `isPure_not_unique_q_one` |
| `MonodromyFiltration.ofNilpotent` "Define …" | Suggested.lean: requested LPV.1 supplier data, "not an Arithmetic construction" | interface promised as a definition here but supplied elsewhere | prose now says LPV.1 supplier data, not defined here; char-0 hypothesis dropped (the formula needs none) |
| `tameCharacter_conj`: `t_ℓ(wσw^{-1}) = χ_ℓ(w) t_ℓ(σ)` | `α = π^{1/ℓ^n}`, `w^{-1}α = ζα`, `σα = ζ_σ α`: `wσw^{-1}α = ζ_σ^{χ_ℓ(w)} α`; `w = Φ` scales by `q`; consistent with `ρ(Φ) N' ρ(Φ)^{-1} = q N'` and Lean's exponent `(χ_ℓ(w) mod ℓ^n).val` | direction correct (χ_ℓ, not χ_ℓ^{-1}) | witness added to the prose |
| `fundamentalCharacter_one_eq_cyclotomic`: `θ_{p−1}^e = χ̄_p|_I`; `ω₂ω₂^p = ω` | over `ℚ_p`: `ζ_p − 1 ≡ (−p)^{1/(p−1)}` to first order, so `σα/α ≡ χ_p(σ) mod 𝔪` (χ̄_p, not its inverse); level 2: `θ_{p²−1}^{(p²−1)/(p−1)} = θ_{p−1}`, exponent `p + 1`; `p = 2`: `𝔽_2^× = 1` so `χ̄_2|_I = 1`, consistent with `ω₂³ = ω = 1` | correct, Lean `fundamentalCharacter_two_mul_pow` is `ω₂ · ω₂^p = ω₁` | witnesses added to the prose |
| WD relation on `Sp(n)`, `geometric_copy_fails`, `dual_special_two`, `special_dual` | `r(Φ)Nr(Φ)^{-1} e_i = q^{-i} q^{i+1} e_{i+1} = q N e_i`; the copy `(ω ⊕ 1, Ne₀ = e₁)` gives `q^{-1} N`; `Sp(2)^∨`: `−N^∨ e₁^* = −e₀^*`, characters `1, ω^{-1}` ≅ `Sp(2) ⊗ ω^{-1}`, `det = ω`; `Sp(n)^∨ ≅ Sp(n) ⊗ ω^{1−n}` at `n = 2` | all consistent with the arithmetic normalisation | `Sp(n)` witness added to the prose |
| `frobCharpoly_{twist, dual, restrict}`, `localEulerFactor_eq_reverse_frobCharpoly_dual`, rank `0` | `det(X − χ(Φ)ρ(Φ)) = χ(Φ)^n P(χ(Φ)^{-1}X)`; `X^n P_{ρ^∨}(1/X) = det(1 − Xρ(Φ)^{-1})`; `Frob_L = Frob_K^f`; `n = 0`: `P = 1`, Euler factor `1` | correct | unchanged |
| `unramifiedCharacter` existence criterion; `weilUnramifiedCharacter`; `localFactor_unramified_twist` | `α ∈ 𝒪_E^×` (profinite closure), root of unity in `ℂ^×`, `α = 1 + ℓ` in `ℤ_ℓ ∩ ℚ̄` (not complete); `α = 1`; `λ_W(α)(F) = α^{-1}`, so `L(λ_W(α)) = 1 − α^{-1}X` and `L(V ⊗ λ(α), X) = L(V, α^{-1}X)` | correct; `λ(q) = χ_ℓ` needs `ℓ ≠ p` and `q ∈ ℤ_ℓ^×` (Lean `hℓ`) | unchanged |
| `localFactor_{omega, special_two, zero, not_exact}`, Examples (Tate curve) | `ω(F) = q^{-1}`: `1 − q^{-1}X`; `Sp(2)`: `ker N = ⟨e₁⟩` of character `ω`: `1 − q^{-1}X`; dual: `1 − X`; `L(Sp(2)) ≠ (1 − q^{-1}X)(1 − X)`; `V_ℓE ≅ Sp(2)` with sub `ℚ_ℓ(1) = ker N`; `η`-twist `1 + X`; `ℤ_ℓ(1)` at `p`: `(1 − p^{-1-s})^{-1}`, `ζ(s+1)` | geometric-Frobenius convention consistent throughout | unchanged |
| `monodromyFiltration_{special, zero, not_kernel}`, `isPure_{special_two, omega, trivial}`, `isPure_tensor` | `N² = 0, N ≠ 0`: `M_{-2} = 0`, `M_{-1} = M_0 = ker N`, `M_1 = V`; `Sp(2)`: `gr_1 ∋ e₀` (eigenvalue 1, weight `w+1`), `gr_{-1} ∋ e₁` (eigenvalue `q^{-1}`, weight `w−1`): `w = −1`; `⊗ω`: `−2`; `N = 0`: `M_{-1} = 0, M_0 = V` | consistent | unchanged |
| `rank_pow_eq_of_pure_graded` relation `Nφ = qφN` | `φ = r(F)` geometric: `r(F)Nr(F)^{-1} = q^{-1}N` ⇔ `Nφ = qφN` | consistent with the arithmetic WD relation; `q` not a root of unity from char 0, `q ≥ 2` | unchanged |
| `epsilon` of `Sp(2)`, `epsilon_dual`, `tateLocalConstant_explicit` | `V^I/(ker N)^I = ⟨e₀⟩`, `det(−r(F)) = −1`, `ε(1 ⊕ ω) = 1` at `n(ψ) = 0`: `−1`; Tate `ε(χ,ψ)ε(χ^{-1}ω_1,ψ) = χ(−1)` with `ψ(−x)` giving the second `χ(−1)`: product `1`; unramified `ν = 0`: `1`; `|𝔤| = q^{(ν+c)/2} q^{-ν/2} q^{-c/2} = 1`; `ω_s(ϖ^ν) = q^{-νs}` matches `q^{-(a + n(ψ)dim V)s}` | consistent; Lean name is `tateLocalConstant_ramified` | Lean name recorded in the prose |
| `localEmbeddingMap`, `localRestriction`, Gaussian / `S_3` checks, `isUnramifiedAt_reduction`, `ramificationSet_dirichlet`, `induced_inertiaInvariants_equiv`, `N_Ind(g ⊗ v) = q^{-deg g} g ⊗ Nv` | `(ι∘σ)* = σ^{-1}ι*σ`; `ρ(σ) : ρ_{ι∘σ} ≅ ρ_ι`; `p = 2` ramified in `ℚ(i)`; `p ≡ 3 (4)` with `2` not invertible (non-split `Ind 1`); Tate curve `ℓ ∣ v(q)`; `c(w^{-1}g) = q^{deg w}c(g)` forces `c(g) = q^{-deg g}`, compatible with `Nh = q^{-deg_K h}hN` on `W_L` | correct | unchanged |
| Promised names without a Lean signature: `grothendieck_monodromy`, `monodromyFiltration_{unique,conj,smul}`, `rank_pow_eq_of_pure_graded`, `isPure_of_filtration_pure_graded`, `det_one_sub_cyclicBlock`, `induced_inertiaInvariants_equiv`, `localEulerFactor_induced`, `wildInertia_trivial_of_semisimple`, `level_two_iff_irreducible`, `hecke_functional_equation` | grep of Suggested.lean | targets have hypotheses in the prose; Suggested.lean is declared non-exhaustive | none (recorded here) |

### Layer 3

| Statement | Instances tried | Result | Change made |
|---|---|---|---|
| `swanConductor` as the weighted lower-numbering sum `Σ_{i≥1} (|G_i|/|G_0|) codim V^{G_i}` | `χ_8` over `ℚ_2` through `ℚ_2(ζ_8)` (`G_0 = G_1` of order 4, `G_2 = G_3` of order 2): `1 + ½ + ½ = 2`; through `ℚ_2(√2)`: `2`; unweighted sum `3` | consistent; the unweighted variant fails | checks already present (`swanConductor_unweighted_fails`, `swanConductor_eq_lowerSum_any`); unchanged |
| `artinConductor = codim V^{I} + Sw` | `χ_{−4}` (`a = 2`, `Sw = 1`), `χ_8` (`a = 3`, `Sw = 2`), Tate curve (`a = 1`), unramified (`0`), `V = 0` (`0`) | agree with the known conductor exponents `4`, `8`, `11` | unchanged |
| `wdConductor = Sw(r) + dim V − dim (ker N)^{r(I)}` | `sp(n)` (`n − 1`), `sp(n) ⊗ χ` ramified (`n·a(χ)`), `sp(2) ⊗ χ` tame with `dim ker N` instead (`1 ≠ 2`) | the `(ker N)^{I}` form is the right one | unchanged (check `wdConductor_kerN_fails` present) |
| `localInduction_conductor` (a)+(b): `a_K(Ind V) = δ(L/K)·dim V + f·a_L(V)` | `L/K` unramified quadratic, `V = 1` (`0 = 0`); `L = K(√π)`, `p` odd, `V = 1` (`Ind 1 = 1 ⊕ χ`, `a = 1 = δ`); Swan part `f·Sw_L + (δ − [L:K] + f)·dim V` gives `0` in both | formula verified on both instances | unchanged |
| `invariants_ind`, `invariants_ind_inertia` | `H = Γ`, `D = 1`; `L/K` unramified of degree `f` | `[Γ : HD] dim U^{H∩D}` degenerates correctly | unchanged |
| `artinConductor_reduction_le` `a(ρ̄_Λ) = a(ρ) − (dim ρ̄^{I} − dim V^{I}) ≤ a(ρ)` | Steinberg lattice `O e₁ ⊕ ℓO e₂` reducing to unramified (`1 → 0`) | direction correct (invariants grow under reduction) | unchanged (check `artinConductor_lift_fails` present) |
| `ellipticConductorExp_values` `f = 0, 1, 2 + δ` | `p ≥ 5` (`δ = 0`), `11a1` (`N = 11`), `I₀^*` over `ℚ_p`, `p ≥ 5` (`f = 2`) | consistent with Ogg `v(Δ) = f + m − 1` | unchanged |
| `primeToPConductor` excludes `p` | `ω_p` (`N = 1` although ramified at `p`); `11a1` at `ℓ = 5` (`N = 1`) and `ℓ = 3` (`N = 11`) | `11a1` has split `E[5]` at `11` (`v_{11}(Δ) = 5`), so `N(ρ̄_{E,5}) = 1` is right; `11a3` (`v_{11}(Δ) = 1`) would give `11` | unchanged |
| `wildImage_finite` | `ℓ = p` | false (case (c) fails), as stated | unchanged |
| standing hypothesis `char F ≠ p`, `ρ(P_K)` finite, perfect residue field | infinite perfect `k` | filtration supplied only for finite `k`; stated as a standing hypothesis for infinite `k` | unchanged |
| citations of earlier layers by hyphenated slugs | — | planning residue | replaced by prose ("Layer 1 integral models", …) |

### Layer 4 (spot check)

| Statement | Instances tried | Result | Change made |
|---|---|---|---|
| `isOdd` and `isOdd_reduction_iff` | `p = 2` (oddness vacuous over `F₂`), `ρ = 1 ⊕ χ̄_p` (odd), `1 ⊕ 1` (even) | the layer states `ρ odd ⇒ ρ̄ odd` only for `p ≠ 2` and keeps `p = 2` one-directional | unchanged (spot check only) |
| odd irreducible ⇒ absolutely irreducible | `p = 2` | excluded in the statement; the characteristic-two exception has its own subsection | unchanged |
| Cartan normalisers `|N| = 2(q² − 1)`, split Cartan at `q = 2` | `q = 2` (`C_s` trivial, `N = GL₂(F₂) ≅ S₃`), `q = 3` (`8`, `16`) | small-field cases stated as separate checks | unchanged |
| `PSL2_normal_subgroups_and_automorphisms`, Dickson's list | `q ≤ 3` (`PSL₂(F₂) ≅ S₃`, `PSL₂(F₃) ≅ A₄` not simple), `q = 9` (`PSL₂(F₉) ≅ A₆ ⊃ A₅`) | stated for `q ≥ 4`; the characteristic-three `A₅` is retained in the refinements | unchanged |
| `cyclotomicSquareSubfield`, `IsBadDihedral` | `[F(ζ_p) : F]` odd (`F′ = F`), `p = 2` | defined for `p` odd only | unchanged |
| Layer 4 as a whole | — | spot-checked on the cases above by the packager; a full row-by-row audit was not run in this sitting | reviewer to complete |

### Layer 5

| Statement | Instances tried | Result | Change made |
|---|---|---|---|
| `GSp.exists_lift` (lifting `GSp_{2a}(A/I) → GSp_{2a}(A)`) | `A` local not complete, `I` not nilpotent | lifting along a non-complete local ring is not justified by smoothness; the source works over a complete ring | scoped to `A` `I`-adically complete Noetherian local (or `I` nilpotent); "no completeness needed" removed; `2 ∉ A^×` kept |
| `semisimplification_iso_of_trace_eq_on_dense` (`n!` invertible) | `Γ = ℤ/3`, `E = F₄`, `n = 2`; `n = 0` | false without `n!` invertible: `1 ⊕ 1` and `χ ⊕ χ` have equal traces, different semisimplifications | negative-control check added; rank-zero check added |
| `semisimplification_iso_of_charpoly_eq_on_dense` (common coefficient field) | discontinuous embedding `ℚ_ℓ → ℚ̄_ℓ` | continuity of the embeddings is load-bearing | negative control added |
| `rankTwo_trace_det_identities` `δ(g)T(g⁻¹h) − T(g)T(h) + T(gh) = 0` | `g = h = 1`; `g = h = diag(a,b)`; `T(gh⁻¹)` variant | holds (`2 − 4 + 2`, `2ab − (a+b)² + a² + b²`); the variant fails | computed witness added |
| `addHaar_zeroLocus_eq_zero` | `A = F_q`, `X^q − X`; zero polynomial | false for finite `A` and for the zero polynomial | negative controls added; `n = 0` and `ℤ_p^×` witnesses added |
| `addHaar_GL_eq_prod` `∏ (1 − q^{-i})` | `n = 0`, `n = 1`, `O_E = ℤ_p` | `1`, `1 − p^{-1}`; denominators `q^i ≠ 0` | witness added |
| `Matrix.algHom_eq_conj_of_isLocalRing` | `d = 0`; `R = ℤ[√−5]` | `d = 0` trivial; non-local counterexample already in prose | unchanged |
| `imageAlgebra`, `brauerClass`, `schurIndex` definitions | character (`β = 1`), `Q₈` over `ℝ`/`ℚ`/`ℚ_ℓ`, finite `k(ρ)`, `k`-span instead of `k(ρ)`-span | passing and failing examples present; `n ≥ 1` implicit | `n ≥ 1` made explicit |
| `hasDirichletDensity_frobeniusSet_openNormal`, `dense_frobenius`, `exists_frobenius_eq_of_finite_image` | `U = G_K` (density 1), `H` trivial | fine; densities positive since `#C ≥ 1` | unchanged |
| `hasDensity_frobeniusSet_of_isClopen` and closed/frontier variants | `C = ∅`, `C = G` | densities `0`, `1` | unchanged |
| `carayol_conj_of_eq_on_dense` | `d = 1` (scalar conjugator), `R = k` a field (`m = 0`, `g = 1`) | fine; uniqueness up to `1 + m` degenerates to uniqueness | unchanged |
| `exists_form_iff_schurIndex_dvd`, `exists_form_iff_brauerClass_eq_one`, `determinant_eq_prod_norm_nrd` | `s_O = 1`, one orbit, finite `k` | consistent with `brauerClass_finite` | unchanged |
| `asai_charpoly_off_subgroup` | `λ = ±1` | repeated eigenvalues, "with multiplicity" already stated | unchanged |
| `potentiallyAbelian_scalar_iff` | `n = 1`, `L = F` | `b = 1` trivially | unchanged |
| `functionField_chebotarev` | `U = Spec F_q` (`π₁ = Ẑ`), constant-field cover `F_{q^m}` | Dirichlet density `#C/#H` holds; natural density by degree would not | kept as Dirichlet density only |

### Layer 6

| Statement | Instances tried | Result | Change made |
|---|---|---|---|
| `tateModule_free` rank `2g` | `l = char K` (supersingular `y² = x³ + 1` over `F̄_5`: `T_5 = 0`; ordinary: rank `g`), `g = 0` | formula false at `l = char K`; `g = 0` gives the zero module (check present) | negative control `tateModule_char_p_excluded` added |
| `weilPairing_galois` multiplier `χ_l`, `tateModule_det_odd` `det = χ_l^g` | `e(cx, cy) = −e(x, y)` at a real place; `det T_l E = χ_l` and `det ρ(Frob_v) = q_v` | consistent with `P_v = X² − a_v X + q_v` (constant term `q_v`, not `q_v^{-1}`) | unchanged (witnesses present in 6.2 and Examples (1), (5)) |
| oddness at a real place for `l = 2` | `l = 2` | eigenlattices span only `2 T_2 A`; stated | unchanged |
| `Isogeny.det_tateModule_eq_degree` | `[n]` (`det = n²`), `φ` of degree divisible by `l` | `det T_l φ = deg φ` in `ℤ_l` with no coprimality hypothesis; `e(φx, φy) = deg φ · e(x, y)` | unchanged |
| `polarizationPairing_perfect_iff` | `λ = [l] ∘ λ_E` (`l · e_l`, not perfect) | hypothesis `l ∤ deg λ` is load-bearing | unchanged (check present) |
| `tateModule_goodReduction_frobenius` `P_v = X² − a_v X + q_v` (arithmetic Frobenius) | `y² = x³ − x` at `5`: `#E(F_5) = 8`, `a_5 = −2`, `P_5 = X² + 2X + 5`; `y² = x³ + 1` at `p ≡ 2 (3)`: `a_p = 0` | computed; geometric Frobenius on `V` would give `X² + (2/5)X + 1/5` | unchanged (checks `localEulerFactor_goodReduction`, `localEulerFactor_not_on_V` present) |
| `localEulerFactor` on `H¹ = V^∨` with geometric `Φ_v` | good reduction (`1 + 2T + 5T²` at `5`), split Tate curve (`1 − T`), nonsplit (`1 + T`), additive (`1`) | agrees with Mathlib's `localPolynomial` `1 − aT + qT²` | unchanged |
| `tateModule_tateCurve` | `l ∤ v(q)` (ramified `E_q[l]`), `l^n ∣ v(q)` (unramified) | `κ|_I = v(q) t_l`, `(V_l E_q)^{I} = ℚ_l(1)`; `|q| < 1` stated | unchanged |
| `lambdaTateModule_finrank` `2g/d` | `E = ℚ` (`V_λ = V_l`), CM curve over `ℚ(i)` at split `5` | freeness over `E ⊗ ℚ_l` kept as an explicit hypothesis | unchanged |
| `IsPGaloisGeneric` | CM curve (Cartan normaliser, infinite index), image never in `Sp` (`χ_p` infinite) | passing/failing examples present | unchanged |

### Layer 7

# Layer 7 adversarial pass

Signatures read: `Suggested.lean` lines 7088–9984 (Layer 7 block) and 10603–11171 (tensor-induction revision, polarised base change, Zariski closures, `CHTGroup.ind`, wreath images, `GSp4Rep` revision). Lean examples for the new checks: `adv-7.lean`.

| Statement | Instances tried | Result | Change made |
|---|---|---|---|
| `charpoly_cyclicTensor`: `C(e(β);X) = ∏_O (X^{|O|} − β_O)` | `n = 1`, `ℓ = 2`, `A₁ = a`, `A₂ = b` (`T = ab`, `B = ab`); `n = 2`, `ℓ = 2` on the diagonal orbit `{(i,i)}` | `β_O` was undefined; the natural reading "product over the whole tuple" gives `X − β_i²` on the diagonal, while the correct block is `X − β_i` (consistent with the stated `C_{n,2}`) | `β_O` defined as the product over ONE period of the tuple; negative control `charpoly_cyclicTensor_not_full_product` |
| `tensorSquareEquiv` (`ρ⊗ρ ≅ Sym²⊕∧²`), `pieri_symPower` (`r = 2`) | `F₂`, `GL₂(F₂)` standard `V`: `x⊗y+y⊗x ↦ 0`; `V⊗V ≅ V⊕P(1)` projective, `Sym²V⊕∧²V ≅ V⊕1⊕1` not | `2 ∈ Aˣ` is load-bearing; the prose only named the hypothesis | negative control `tensorSquareEquiv_not_char_two` added to 7.1 and cross-referenced in 7.8 |
| `adDecomp_of_invertible` (`ad = A·1 ⊕ ad⁰`, perfect trace pairing on `ad⁰`) | `F_p`, `n = p`: `tr 1 = 0`, `1 ∈ ad⁰ ∩ A·1`, `tr(1·Y) = 0` on `ad⁰` | fails when `p ∣ n`; only the `F₂`, `n = 2` membership check existed | negative control `adDecomp_of_invertible_not_dvd` (degenerate pairing stated) |
| `ofDeterminant_compat`: `det(X − ad ρ(g)) = (X−1)·det(X − g|ad⁰)` | `n = 0`: left side `1`, right side `X − 1` | false in rank zero | hypothesis `n ≥ 1` made explicit at the identity |
| `liftProjective_hodgeTate` (2): weights `{−1,0}` | `s = T_ℓE`, `s = H¹(E)`; BCGP's convention `HT(ε) = −1` | the printed `{0,1}` of the source converts to `{−1,0}` under `HT(χ_ℓ) = +1`; weights were not labelled, "above `ℓ`" was ambiguous | weights labelled by `τ : F_v → ℚ̄_ℓ` at every `v ∣ ℓ`; convention witness (`T_ℓE` has `{0,1}`, BCGP write `{0,1}` with `HT(ε) = −1`) added |
| `hodgeTate_of_char`: "characters with all weights `x/d` exist" | `d ∤ x` | these are Hodge–Tate–Sen weights; such a character is not Hodge–Tate | reworded; `HT_τ(χ_p) = +1` and labelling by `τ` stated in `hodgeTateWeights_tensor_symPower` |
| `PolarizedRep` form (a): sign convention `ε = −μ(c)`; rank-one trap "`r^c = r^∨⊗μ` forces `μ = r r^c`" | `n = 1`, `⟨x,y⟩ = uxy`: covariance ⇒ `μ|_{G_F} = r r^c`, symmetry ⇒ `ε = 1`, CM ⇒ `μ(c_v) = −1`; `(1, δ_{F/F⁺})` polarised, `(1,1)` not | convention correct, but no computed witness; the CM sign condition was not in the prose definition although it is a field of the Lean structure | two-term witness added to the definition; `cm_sign` clause added; check `rank_one_multiplier_eq_mul_conj`; `rank_one_imaginary` scoped to the Lean signature (domain, `2 ≠ 0`) |
| `PolarizedRep` form (a) generality | Lean structure takes any `Δ` (no index or openness) | prose claimed "open of index ≤ 2" as part of the definition | prose notes "Lean: any subgroup `Δ`" |
| `IsTotallyOdd` in characteristic 2 | reduced `A` with `2 = 0` (automatic, `μ(cc')² = 1`); `F₂[t]/t²`: `(1+t)² = 1 ≠ 1+t` | the claim was right but uncomputed | witnesses computed; checks `isTotallyOdd_of_reduced_char_two`, `isTotallyOdd_not_nonreduced_char_two` |
| `IsBalancedAt`, `isBalancedAt_iff_trace` | trivial `F₃²` (trace `−1`, `a = 2`, `b = 0`); `n = 4`, `ℓ = 5` (`a − b = 4 ≡ −1`) | thresholds `ℓ > n+1` (even), `ℓ > n` (odd) are sharp; Lean definition has no characteristic hypothesis | "(d)" scoped: Lean any `K`, meaningful for `2 ≠ 0`; `ℓ = n+1` sharpness noted |
| `exists_root_mul_finiteOrder` (`χ₀` cannot be dropped) | `Γ = ℤ/2`, sign character, `m = 2`: `χ₁(g)² = χ₁(g²) = 1 ≠ −1` | claim right, no witness | check `exists_root_mul_finiteOrder_not_finiteOrder_dropped`; "`χ₁` needs the algebraic closure" matches the Lean codomain `ℚ̄_ℓ` |
| `isAdequate_*` definitions | `SL₂(F₇)` (passes), `SL₂(F₅)` (`H¹ ≠ 0`), `SL₂(F₃)` (`ℤ/3` quotient), `p ∣ n`, trivial group on `k²` (`H⁰(1,ad⁰) = ad⁰ ≠ 0`, span of `{1}` a line) | `p ∤ n` is not assumed by Thorne 2012; it follows from `H⁰(H,ad⁰) = 0` (`1 ∈ ad⁰` when `p ∣ n`); Lean definitions take any subgroup, prose said finite | that derivation stated; check `isAdequate_not_trivial_group`; "Lean: any subgroup" noted; `isWeaklyAdequate_iff_trace_condition` justified (`e_{g,α}` is a polynomial in the semisimple `g^{p^N} ∈ H`) |
| `not_hasBigImage_of_zeta_mem` (`p = 3`) vs `hasBigImage_of_surjective` (`p ≥ 5`) | scalar `λ·1 ∈ GSp₄` has `ν = λ²`: `F₃ˣ = {±1}` gives `ν = 1`; over `F₅` the scalar `2` has `ν = 4 ≠ 1` | why (H1) fails exactly at `p = 3` was not computed | witness added; same computation attached to `twImageConditions_elliptic` (`2·1` has `ε̄ = det = 4 ≠ 1` in `F₇`) |
| `tensorInd_character` (`⊗-Ind ψ = ψ∘Ver`) and `charpoly_asai`, `g ∉ H` | index two, transversal `{1,g}`: `Ver(g) = g²`; rank one gives `X − β` with `β = ψ(g²)`; rank two trace `a = tr ρ(g²)` | consistent; no computed witness | witness added to `tensorInd_character`; Lean example `transfer ψ g = ψ(g²)` |
| `traceBilinForm_isPerfPair`: "nondegeneracy alone fails over `ℤ`" | `2xy` on `ℤ` (nondegenerate, not perfect); the trace pairing itself is perfect over `ℤ` | the sentence read as if the trace pairing were degenerate over `ℤ` | reworded with the `2xy` witness |
| `symPower_not_dual_char_p` | Lean states `Sym³V ≇ (Sym³V)^∨⊗det³`; prose stated `Hom(Sym³V,V) = 0` | both true (uniserial `Sym³V`: sub `V`, quotient `V⊗det`); prose did not match the Lean form; divided powers vs quotient powers | prose gives the Lean form and `Γ³V = (Sym³V)^∨⊗det³`; "`Sym^d → Γ^d` iso iff `d! ∈ Aˣ`" added |
| `resScalars_ne_ind` | Lean: `E/K` quadratic field, `char K ≠ 2`; prose: `B = A×A` | instance mismatch | prose scoped to the Lean instance |
| `GSp4Rep.conj_iff_gl4`: "false in characteristic 2" | no witness available | unsupported falsity claim | reworded: `char ≠ 2` is the source's hypothesis |
| `GSp4Rep` (`2 ∈ Aˣ`), `SimilitudeGroup.groupScheme` (`B` perfect), `monodromyGroup` | Lean structure has no `2 ∈ Aˣ`; Lean takes any Gram matrix `J`; Lean ideal lives in the coordinate ring of `M_n` | generality mismatches | prose notes where each hypothesis is used / the Lean carrier |
| `symPowerForm`: `B_d(v_i, v_{d−i}) = (−1)^i/binom(d,i)`; `d! ∉ Fˣ` degenerate; `p = d = 7` | `d = 1`; monomials with `(d−i)!i!` matching permutations; `d!B_d(v_0,v_d) = d!`; `Sym⁷` uniserial for `SL₂(F₇)`, `Sym^{2p−1}` irreducible | all consistent | computations recorded |
| `h1_borel_symPower`, `h1_SL2_adZero`, `isEnormous_symPower` (`p > 2n+1`) | `SL₂(F_p)`, `k = p−3` (`i = k`); `GL₂(F_p)`, `k = 2`, `j = −1` (only `i = 0`); `n = 2`, `l = 5` | thresholds consistent and sharp (`2i ≤ 2n−2 < p−3`) | resonance computations recorded; the sharp instance named |
| `rankOne_forces_odd`, `ofSimilitude_nu`, `no_invariants_fails_char_two`, `GSp_4` change of `J` | `r(γ₀)² = (μ₀, μ₀²)`; `ν((g,−1)) = ν(g)(−1)^{n+1}(−1)`; `−1ᵀ = 1`; `PᵀJ₄P = J` | consistent | computations recorded |
| `changePlace`, `det_eq`, `even_of_alt`, `sign_unique`(4), `similitude_ambiguity`(5); polarised `dual`/`twist`/`tensor`/`extPower`/`symPower` multipliers; `toGSpOrGO` | `ε_{v'} = −μ(c_{v'})`; `(χ∘Ver)(c) = χ(c²) = 1`; `εε' = −μ''(c)`; `(−1)^{k−1}μ(c)^k`; char 2 (`μ(c)² = 1 ⇒ μ(c) = 1`); `ψ⁴ = 1`; `B(y,x) = ε_vμ(c_v)B(x,y)` | consistent with the Lean `_hc` binders | derivations recorded in one clause each |
| `symPower_rank`, `extPower_top`, `charpoly_symPower_univ`, `tensorInd_rank`, `extPowerPairing`, `adQuot_equiv_symSq`, `one_mem_adZero_iff`, `IsEnormous.not_dvd`, `isEnormous_of_rank_one`, `twImageConditions_rank_one`, `isTidy_of_center`, `tate_h2_qz_eq_zero`, `h0_h1_baseChange`, `h1_res_injective_of_index_unit`, `PGL2.isSimpleGroup_of_isAlgClosed` (Goursat) | `n = 0`, `d = 0`, `d > n`, `A = 0` (excluded by `Nontrivial`), `H = Γ`, `F_p(t)`, `ℝ`/`ℂ`, `#K ≤ 3` | fine; `A ≠ 0`, `n ≥ 1`, `d ≤ n` made explicit where the Lean has them | hypotheses surfaced; no statement changed |

