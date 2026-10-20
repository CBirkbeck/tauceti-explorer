# Independent package review: K-theory of finite and local fields (round 2)

Issue #11294; job `REV-PKG-KTheoryFiniteLocalFields~codex2`; Claude (Opus 5.5),
session `claude-b5LcEu`; 20 October 2026. Verdict: **accepted**, after the
corrections listed below were made in place.

I did not write the package, its fixes or the earlier reviews. I read the whole
README and Suggested.lean, the accepted 280-node packet, the previous report
`REV-PKG-KTheoryFiniteLocalFields~codex.md`, the fix handoff
`FIX-PKG-KTheoryFiniteLocalFields~adv3.md` and the maintainer's instructions in
issues #11283 and #11294. The work started from atlas `main` at `a76d79436`.

## Verdict

The two earlier findings are closed. The maintainer fixed the supplier order
(R1). HermitianKTheoryOfPoincareCategories §§7.10–7.11 state exactly the
multiplicative comparison that §1.7 consumes (R2). The packet is byte-identical
to the accepted plan. Its 39 source-proof gaps and 34 requests are untouched,
and the README claims none of those proofs.

This review found eight further defects, all with clear fixes, and corrected them
in the package files. Two of them would have blocked an upstream port. Several
targets duplicated material that the upstream roadmap ClassicalArithmeticCompletion,
now on TauCetiRoadmap main, already plans (F1). Several supplier citations
pointed at the wrong sections of the suppliers' roadmaps (F2). The rest are about
fidelity to the plan, one false check and form. With the corrections, items 1–6
of the issue all hold.

## Findings and corrections

| # | Finding (evidence) | Correction made |
| --- | --- | --- |
| F1 | **Duplicates an upstream-main roadmap.** TauCetiRoadmap main (`e20599e`, 20 Oct) has ClassicalArithmeticCompletion §1.14 `normResidueSymbol`, in the same orientation as ours: (a,b) = Art(a)(β)/β, with arithmetic Frobenius. Its API includes `normResidueSymbol_pow_of_dvd` (exponent change), `normResidueSymbol_tame` (the tame formula), `normResidueSymbol_eq_one_iff_mem_normGroup` (the norm criterion) and perfectness. §§3.1–3.2 asked for these to be proved again. That section's own Check, (7,2)_(ℚ₇,3) ≡ 4 = 2^((7−1)/3), agrees with our formula (π,u)_d = ω(ū)^((q−1)/d). GeneralAlgebraicKTheory §8.12 `localizationBoundary_DVR_valuation` already identifies the degree-one DVR boundary with v, which §2.2 asked for again. | A supplier paragraph now states these exports; §§1.24 and 1.52 are added for §7.3. §3.1 defines `normResidueMap` as K2SymbolsBrauer §14.6's `normResidueK2` with m = w. §3.2 consumes the tame formula and the norm criterion and keeps only the K₂-level comparisons and the local projections. §2.2 consumes §8.12. Every plan statement is still written out; it is now cited, not proved here. |
| F2 | **Supplier sections cited by stale stage numbers.** "K2SymbolsBrauer Layers 2–4 and 7" are the old campaign stages T.2–T.4 and T.7. In the K2SymbolsBrauer roadmap, those layers are Steinberg-group refinements, finite-rank sections, π₂ of the K-space and the native Matsumoto dictionary. Tame symbols are §§9.2–9.5, norms Layer 10, the localization comparison §§11.1 and 11.8, and Hilbert symbols §§14.6–14.9. "GeneralAlgebraicKTheory Layers 1–3 and 7" omitted localization, dévissage and resolution (Layer 4), Waldhausen theory (Layers 5–6) and the DVR boundary (§§8.12–8.13). "RefinedTraceMethods Layers 1–3" omitted the cyclotomic trace (§4.11) and the nilpotent and rational comparisons (§4.17). Hermitian "HK.0–1/HK.7", CrystallineCohomology's "logarithmic algebra layer" (log differentials are §CR.5.1) and ArithmeticGaloisDuality's unnamed layers (R02.1, §R02.3.1 `RestrictedRamification.unramifiedSubgroup`) were also imprecise. | Every supplier paragraph now cites the actual section, and export where one exists, at the heads read: #1212 `c8bfac4`, #851 `01c64f0`, #857 `f1f560c`, #858 `567ff2b`, #1266 `cb2a639`, and the local K2SymbolsBrauer and RefinedTraceMethods packages. |
| F3 | **Boundary sign: two suppliers, one convention.** GeneralAlgebraicKTheory §8.13 makes ∂ right linear with ∂[π] = +[k], and K2SymbolsBrauer §11.1 identifies that ∂ with the tame symbol in reversed order. The package's Conventions demand a left-linear boundary from the same supplier, without saying where it comes from. | The contract now names §8.13's uniformizer-last normalization δₙ = (−1)^(n−1)∂ₙ (`uniformizerLastSign`), which is exactly our left-linear boundary: δ₁ = ∂₁ and δ₂ = −∂₂, so δ₂ is the tame symbol. Check: on ℤ₍₅₎, K2SymbolsBrauer's Check gives ∂{5,2} = 2, so δ{5,2} = 3 = ∂{π,u}, which is ours. |
| F4 | **Plan clauses missing from the README.** A clause-level comparison of all 280 nodes found 33 sub-statements absent. Examples: the Moore-space description and the ring-homomorphism and coprime clauses of the products (§1.1); Φ^a acting by p^(ai), ψ^q = id, the decomposition S⊗V ≅ ⊕g*V and the Galois-invariant subgroup (§1.5); 𝔽̄p equivariance and invariants and the explicit coefficient ring (§1.6); Hℤ₂ and the Witt-rank statements (§1.7); BSL⁺ homotopy and homology and naturality (§1.9); T₁ = μ_(q−1) and the i = 1 section (§2.3); the torsion of K₂ᵢ₋₁(L) (§2.5); the I-formula for π₀TR, TC = hofib(R−F), the Milnor sequence and coefficient TC (§4.2); the module structure and F, V of the orbit spectral sequence (§4.4); the fibre-product form of integral TC (§4.4); the Λ_C-module and Connes representative (§4.5); Waldhausen's isomorphism homotopy (§4.6); mod-p THH, F-kernel and ∂-surjectivity and TC₋₁ mod p (§5.1); the ghost consequence and the p = 2 counterexamples (§5.2); the relative log sequence and the e_(L/K) residue formula (§5.4); the general ℤ_(p) orbit comparison (§5.10); u_K base change and the Ê² formulas (§5.11); ∂-versions of the Moore kernel (§3.4); the i ≥ 1 p-primary torsion and T_p = 0 (§6.8); and K₁(E;ℤ/p^ν) with κ = 0 (§6.11). | Each clause was restored in the section concerned, in my own words, with the packet's locator. Each was recomputed in the pass below. The historical clause on special cases proved earlier (Suslin, Gillet–Thomason) is provenance, not a target, and was not added. |
| F5 | **Scope differs from the plan.** Four statements were wider than the plan: the Browder ring for every m dividing q−1 (the plan has ℓ^ν); π₀logTHH = A for every DVR (the plan has mixed characteristic); the orbit spectral sequence without its Witt-vector category hypothesis; and the relative-TC sequence inside a "regular noetherian" paragraph although the plan allows any 𝔽ₚ-algebra. Two were narrower: the power-compatibility lemma only for (E,w), and the p-primary torsion only for i ≥ 2. One was wrong: "q-Frobenius acts on the source field's group", where the action is on 𝔽_(q^d). | Each scope now matches the plan. Composite moduli are reached through the stated Chinese-remainder product. The Frobenius sentence was rewritten on K₂ᵢ₋₁(𝔽_(q^d)), with powers and the Galois sum. |
| F6 | **False check in §1.9.** It cited "exceptional rank-one q = 3 and q = 9 multipliers". H₂(SL₂(𝔽₃);ℤ) = 0: the group acts freely on S³, so its multiplier vanishes, as the AV erratum in the atlas errata register also says. Only H₂(SL₂(𝔽₉);ℤ) ≅ ℤ/3 is exceptional. | Corrected in the target and in the Check. The odd-order conclusion is unchanged. |
| F7 | **Lean redundancy.** `tameCoordinate_two_uniformizers_mod_five` was a sorry'd restatement of the second proved `example`, word for word. | Deleted from Suggested.lean and from the README list. |
| F8 | **Form.** README line 37 carried a commit hash ("Current Tau Ceti at a91d3aa…"), against the rule that roadmaps are timeless. 308 locators ran words into numbers ("Theorem2.1", "tag07GC"). The Layer 1 title promised Brauer lifting and Quillen's model, which are supplied by GeneralAlgebraicKTheory. The §6.1 API names differed from the Lean names, and the Lean layer titles differed from the README's. | The hash is removed. Spaces were added mechanically outside URLs and code spans; with spaces deleted, the result is byte-identical to the input. Layer 1 is now "finite fields over the supplied Brauer–Quillen comparison". The §6.1 API names match the Lean declarations, and the Lean layer titles match the README. |

## The six review items

1. **Upstream form.** The README follows the shape in PACKAGE_REVIEW.md: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight layers of `### k.n` prose with Checks, Examples and Dependencies, Downstream consumers and References. It is 227 KB. The issue template's 200 KB sentence is superseded by the binding 12 October shape rule, which sets no size limit. Nothing was cut to save space.
2. **Fidelity.** All 280 nodes are covered: 28 as boundaries named in the contracts and 252 in the README sections given by the earlier coverage map. Three of that map's rows point to the wrong section, though the content exists: `L.6/torsion-free-lattice-lemma` is in §6.1, and `L.5/kernel-of-restriction` and `L.5/log-de-rham-witt-dvr-divisible` are in §5.5. After F4 and F5, each node's statement, hypotheses and ranges are in the README. The README claims nothing beyond the plan except corrections, each with its witness: the §1.2 image-root caveat, the §1.9 general-a formula and the q = 9 correction.
3. **Own words.** No source passage is reproduced and no source is summarized section by section. Every target has a theorem, section and page locator.
4. **No process.** There are no job ids, packet names, reviews, checkpoints, PR numbers or commit hashes.
5. **Suggested.lean.** `lean-check` exits 0 with exactly 17 `declaration uses sorry` warnings and no other output beyond the pinned `#check`. The file has 206 lines: two real-bodied definitions, 17 sorry'd theorems and four proved examples. `scripts/check_sorry_data.py` passes. There is no sorry'd data, development of theory or `True` placeholder. All 17 statements were checked by hand (table below) and match §3.2 and §6.1.
6. **metadata.toml** is the single line `topic = "math.KT"`, which fits.

## R1 and R2

- **R1.** Issue #11283, written by the maintainer, records that K2SymbolsBrauer, MotivicEtaleKTheory, RefinedTraceMethods and HermitianKTheoryOfPoincareCategories precede this roadmap in the build order. The contract graph in the README matches. Upstream main has gained only PerfectoidSpaces and ThetaSeries since the last review, and neither overlaps this package. The full-text sweep of all 105 main READMEs is what found F1.
- **R2.** I read HermitianKTheoryOfPoincareCategories at the authorized head `5ee945a` and at the current PR head `cb2a639`. The README's SHA-256 at `5ee945a` matches the fix handoff. Between the two heads §§7.10–7.11 changed only to consume GeometryOfNumbersAndQuadraticArithmetic §6.10b's `poincareTensorProduct` internally. The package contract matches the supplier clause by clause:
  - a commutative algebra object with tensor exact in each variable and coherent Poincaré multiplication and unit;
  - lax symmetric monoidal K, GW and L, with Ξ a unital E∞ map natural in algebra maps;
  - application to every commutative ring R without characteristic or finiteness hypotheses;
  - forgetting the multiplication recovers §6.8a's Ξ;
  - the cartesian E∞ square, and the GW-module fibre sequence with actions through forgetting and through bordification;
  - module objects, with semilinear base change, coherent for identities and composites, and scalar-extension maps that need not be equivalences;
  - derived extension carrying the line, its involution and the shift, with no unit for twisted or shifted structures.

  I read Calmès et al. III, arXiv:2009.07225v4, Proposition 3.1.4 and Remarks 3.1.5–3.1.6, pp.50–52 (PDF SHA-256 `1e4b6720…f770c`, matching the fix handoff). §1.7's graded-ring argument is faithful to Remark 3.1.5. The source's "any ring endomorphism is an isomorphism" is false for x ↦ x², and the README's degree-preservation Check handles exactly that case.

## Adversarial mathematics pass

Each row is a statement in the package, the instances I computed, and the outcome. The rows marked new are the clauses restored under F1–F6.

| Statement | Instances computed | Outcome |
| --- | --- | --- |
| `tameCoordinate` swap, uniformizer change, multiplicativity; controls | Over 𝔽₅: (0,1,2,1) ↦ 2; (1,1,1,1) ↦ 4; (−1,1,2,3) ↦ −6 = 4; changing π to 2π gives v′ = 3, so (0,1,2,3) ↦ 2. The unit groups of 𝔽₂ and ℤ/1 are trivial. The swap identity holds by (−1)^(rs) = (−1)^(−rs). | All hold; the two proved examples decide. |
| `maxDivisible` API and controls | ℚ ↦ ⊤; ℤ/6 ↦ ⊥ (6·y = 0); ℤ ↦ ⊥; ℚ×ℤ/6 ↦ ℚ×0. The supremum is divisible, being the sums of divisible subgroups; complements exist by injectivity. | All hold. |
| Tame and boundary convention | The K-book's Lemma III.6.3 (p.234) has ∂(π,u) = ū, and ours has ∂{u,π} = ū, so "inverse of the K-book symbol" is correct. With K2SymbolsBrauer §11.1, ℤ₍₅₎ gives K-book ∂{5,2} = 2 and δ{5,2} = 3. | Consistent across GeneralAlgebraicKTheory §8.13, K2SymbolsBrauer §§9.2 and 11.1, and the Conventions (F3). |
| Hilbert orientation and tame formula (§§3.1–3.2, 7.3) | ℚ₅: h{5,2} = ω(2), h{2,5} = ω(3). ℚ₂: h{−1,−1} = −1 with tame value 1. ℚ₂(ζ₃): w = 6, u₃ = 2, so π₃h = (−,−)₃². Upstream ℚ₇ check: (7,2)₃ ≡ 4. | Agree with ClassicalArithmeticCompletion §1.14 (F1). |
| §1.7 multiplicative comparison | x ↦ x² is not degree-preserving; the zero map is not unital. Under 𝔽₂ → 𝔽₄ the trace form is [[0,1],[1,1]], a Lagrangian line, so Witt class 0. For 𝔽₂×𝔽₂, idempotents are preserved. Over ℤ → 𝔽₂, ⟨−1⟩ ↦ ⟨1⟩. | Retained; faithful to the supplier and to Remark 3.1.5. |
| §1.7 perfect characteristic two (new) | On K₀ 2-adically, Hℤ₂ on each side, while 𝔽₄ has integral K₁ = ℤ/3. Rank mod 2 is a Witt-group isomorphism, since ⟨x⟩ = ⟨y²⟩ = ⟨1⟩; odd L-groups vanish. | Holds; it is a 2-complete assertion only. |
| §1.9 multipliers (F6) | SL₂(𝔽₉) has H₂ = ℤ/3, odd. SL₂(𝔽₃) is the binary tetrahedral group, acting freely on S³, so H₂ = 0, though H₁ = ℤ/3. The universal coefficient theorem for H₃(−;𝔽₂) uses only the 2-torsion of H₂. | Corrected. |
| §1.9 Chern product for every a (new) | Over 𝔽₅, a = 2 gives a nonzero value and a = −1 = 2² gives zero. Over 𝔽₃, a = −1 gives a nonzero value. | The formula holds for every unit; it is nonzero exactly for nonsquares. |
| §1.5 Frobenius on extensions (F5, new) | 𝔽₂ ⊂ 𝔽₄, i = 2: 1+4 = 5 = 15/3, with invariants of order 3. 𝔽₃ ⊂ 𝔽₉, i = 1: 1+3 = 4 = 8/2. At j = 0 the action is the identity. | Holds. |
| §1.6 Browder ring and 𝔽̄p (new) | ℓ^ν dividing q−1: ψ^q−1 acts on π₂ₙBU by qⁿ−1 ≡ 0 mod ℓ^ν, so ρ is an isomorphism on even mod-ℓ^ν groups. Composite m by the Chinese-remainder product. Automorphisms of ⊕ℚℓ/ℤℓ form ∏ℤℓ×, which is commutative, so every isomorphism is equivariant. | Holds. |
| §1.1 coefficients | m = 1 gives zero. K₁(𝔽₅;ℤ/4) = ℤ/4, K₂(𝔽₃;ℤ/2) = ℤ/2 and K₂(ℤ;ℤ/2) = ℤ/4 (2β₋₁ = {−1,−1}). The Moore-space description holds for n ≥ 2 (K-book Definition IV.2.4, p.280). | Holds. |
| §§2.1–2.5 | ℤ₅ with m = 4: two copies of ℤ/4. m = p is excluded because principal units survive. ∂{ω(2),5} = 2 and ∂{5,ω(2)} = 3. Changing π from 5 to 10 adds [2]. T₁ = μ_(q−1). ℚ₃: K₁ completed at 2 is ℤ₂⊕ℤ/2. | Holds. |
| §3.4 ∂-versions (new) | ℚ₅, ℓ = 2: K₂/2 ≅ 𝔽₅×/2 = ℤ/2 ≅ μ₄/2, because K₂(ℤ₅) is uniquely 2-divisible. | Holds. |
| §4.2 TC and Witt (new) | π₀TR²(𝔽ₚ) = ℤ/p², with R = F = reduction and V = ·p. Over ℤ at p = 3, R[2]₂ = 2 and F[2]₂ = 8. On the limit, hofib(R−F) = hofib(id−F). HM97a Theorem 3.1 (fibre product; agreement after p-completion) was read. | Holds. |
| §4.5 Tate | C₃ on 𝔽₃: every group is 𝔽₃. C₅ on ℤ: Ĥ⁰ = ℤ/5 and Ĥ⁻¹ = 0. Mod-p THH(𝔽ₚ): d²ε = tσ, so E³ = Λ(u)⊗𝔽ₚ[t^±]. | Holds. |
| §5.1 perfect fields (new) | n = 2, k = 𝔽ₚ: ker F on TR²₂ is pℤ/p² = V(W₁). TC₋₁(𝔽ₚ;ℤ/p) = coker(1−φ) = 𝔽ₚ; over 𝔽̄ₚ it is zero. In TC⁻(𝔽ₚ), ũv = p. | Holds. |
| §5.2 p = 2 failures (new) | In W₃(ℤ), V(1)−[−2] has ghost (2,−2,−14), which is not in 2W₃ (it would need 8c = −20). In W₂(ℤ), [−1]+1 has ghost (0,2), not in 2W₂. At odd p, V(1)−[−p] is in pW₂, e.g. p = 3 with quotient (1,3). | The plan's ranges are confirmed. |
| §5.3–5.6 | Without p-th powers, [2]₂ − 2 = V(2) ∉ 3W₂(ℤ₃); with them, [8] − 2 = 3·(2,54). πφ′(π) = p(πθ′−eθ), and for π^p = p it is p². Twisted Leibniz at n = 2, p = 3: 2x³dx versus 2xdx. | Holds. |
| §5.11 ℚ₃(ζ₃) | φ = X²+3X+3, θ = 1+π. u = 1−π gives u² ≡ 1+π mod 3 and dlog ζ = π dlog π = −π u⁻¹ dlog(−3) mod 3. The root −u fails. | Holds. |
| §§5.13–5.17 | p = 3, e = 2: x = α gives χ = −1, and x = τα³ gives χ = 0. B₁ = p. 𝔽₃[x]/(x²) has relative K₁ of three elements. 𝕎ₙ/Vₙ𝕎₁ ≅ 1+xk[x]/(xⁿ). | Holds. |
| §6.3–6.7 values | ℚ₂: w₁ = 2, w₂ = 8, so completed K₃ = ℤ₂⊕ℤ/8 and K₅ = ℤ₂⊕ℤ/2. ℚ₃: w₆ = 9, giving K₁₁. For unramified L, p-primary w₂ is 8, 3, 1. ℚ₅(ζ₅): k = g⁴, so π₁ has order 5. | Holds. |
| §6.8 i = 1 (new) | K₁(L){p} = μ_(p^∞)(L): trivial for ℚ₃, ℤ/3 for ℚ₃(ζ₃). K₂(L)⊗ℚₚ/ℤₚ = 0 because U is divisible. Tₚ(L×) = 0. | Holds. |
| §6.11 equal characteristic (new) | K₁(E;ℤ/p^ν) = E×/p^ν, while j ≥ 2 completed groups vanish, so κ = 0. 𝔽₃((t)): K₂ ⊇ ℤ/2 and K₃ ⊇ ℤ/8. | Holds. |
| §7 completion | {−1,−1} ↦ −1 at 2 and 1 at 3. 2+i over 5 has valuations 1 and 0 (residues 0 and 4). −1 vanishes 5-adically in K₁. | Holds. |

## Ownership moves for the plan

These targets are now consumed rather than planned. The packet still lists them as nodes of this roadmap, and its next revision should point them at the new owners:

- `L.3/norm-residue-power-compatibility`, `L.3/tame-unit-pair`, `L.3/tame-uniformizer-unit`, `L.3/tame-integer-coordinates` and the symbol-level half of `L.3/norm-residue-local-reciprocity` move to ClassicalArithmeticCompletion §1.14.
- The construction of `L.3/norm-residue-map` moves to K2SymbolsBrauer §14.6.
- The valuation clause of `L.2/dvr-localisation` moves to GeneralAlgebraicKTheory §8.12.

## Notes for the maintainer

- HermitianKTheoryOfPoincareCategories §7.10 already has, as a Check, the finite-even graded-ring identification that §1.7 plans as `finiteEven_multiplicativeLTate`. One of the two should own it at port time.
- K2SymbolsBrauer is still under revision (`needs_changes`). The section numbers cited here are the same in all three of its README versions since 19 October. Its downstream section already says that this roadmap consumes its Layer 14 and owns Moore's theorem.

## Sources and checks run

- Read: K-book author PDF (SHA-256 `a04f53c9…8845`), III.6.3 p.234 and IV.2.4–2.8 pp.280–282; Calmès et al. III v4, pp.50–52; HM97a author PDF (SHA-256 `833d5ded…4c09`), Theorem 3.1. Supplier READMEs at the heads listed under F2; ClassicalArithmeticCompletion and the other 104 READMEs at TauCetiRoadmap main `e20599e`. All fetched text was treated as data, and none contained instructions.
- Delegated: two Sonnet subagents ran a clause-level coverage cross-check and a declaration and section existence check. I verified every item they reported against the source myself before acting on it.
- `lean-check …/Suggested.lean`: exit 0, 17 sorry warnings, nothing else.
- `scripts/check_sorry_data.py`: pass.
- `scripts/check_blueprint.py research/blueprint/packets/KTheoryFiniteLocalFields.json`: 0 errors, 0 warnings; 280 nodes, 39 gaps, 34 requests, unchanged.
- review.json parses; `git diff --check` is clean.
