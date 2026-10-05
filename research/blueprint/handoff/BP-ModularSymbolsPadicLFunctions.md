# BP-ModularSymbolsPadicLFunctions — checkpoint 7

Codex — session `codex-FQUA02`, 5 October 2026. Refs #777. **Status: partial.** L0–L3 are `planned`; L4 is `partial`. This checkpoint continues the six earlier checkpoints by Claude Code (`cc-39fac3`, then `cc-fb70e5`). The earlier mathematics is retained, with the newly assigned Nakamura splitting added and the signature coverage corrected.

## What this checkpoint adds

Two L0 nodes address `PAPER-NAKAMURA-23/23`:

- `rational-hecke-separation`: coprime rational annihilators for the parabolic subspace and boundary quotient in the good Hecke algebra. Elkik supplies the weight-two proof; the higher-weight primary-source step remains an explicit gap.
- `drinfeld-manin-splitting`: the unique rational Hecke-equivariant retraction, built from those annihilators by a Bézout polynomial projector. Seven API items and four discriminating tests are actual Lean declarations and examples. The tests distinguish ordinary from parabolic cohomology, exclude the zero retraction, check a nontrivial polynomial projector, and exhibit an integral obstruction.

The new suggested section uses native `Γ(N)`, `groupCohomology`, the existing parabolic carrier, `Module.End`, `Algebra.adjoin`, `IsCoprime`, and native projection theory. Its full-level Hecke actions are expressly prototypes to be transported through the requested coefficient dictionary. Their pairwise commutation is stated. All seven new API names and four test names occur outside comments, together with the separation theorem. No arithmetic realization or Galois action is invented to make the file elaborate.

The inherited `slash`, `heckeT` and `heckeU` signatures now require a genuine right monoid action, represented by `(Sigma0 N)ᵐᵒᵖ →* Module.End R V`. Preservation and `heckeT_comm` require its restriction to the given Γ-action; commutation also requires an equivariant symbol and both indices prime to the level. This fixes missing hypotheses, rather than asserting preservation for arbitrary coefficient maps.

L0 still has six planets. The period-symbol node remains; its planet slot now displays **Drinfeld–Manin splitting**. No imported Div⁰, Manin, homological symbol or period-map construction is re-planned.

## Source results and the boundary of the proof

Sources added and read on 5 October 2026:

1. Kentaro Nakamura, *Zeta morphisms for rank two universal deformations*, Invent. Math. 234 (2023), 171–290. [Published open-access PDF](https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf). Read §3.1.1–3.1.2, pp. 202–207, and the opening of §3.2, p. 220, including (20)–(21). Printed page is PDF page plus 170. SHA-256: `47682f856244439d8cc3d3e6e0a4e1f804e6a710ec1a2dde8fad76f94aea20e4`.
2. Renée Elkik, *Le théorème de Manin–Drinfeld*, Astérisque 183 (1990), 59–67. [Numdam PDF](https://www.numdam.org/item/AST_1990__183__59_0.pdf). Read the introduction and §§I–III, with the weight-two spectral proof in §III, pp. 64–66. Printed page is PDF page plus 57. SHA-256: `7618e61b8ec287b9fcce61fb4ac7d89ea98d58ca9274fa899ed52cda670b19b5`.
3. Romyar Sharifi, *Modular curves and cyclotomic fields*, AWS 2018 notes. [Course PDF](https://swc-math.github.io/aws/2018/2018SharifiNotes.pdf). Read §3.4, pp. 34–38, including Theorem 3.4.16, its proof paragraph and Remark 3.4.17. Printed page equals PDF page. SHA-256: `8fe8f4c77019e84c7c6c80bdaedcc507c643ab3a952e3b0b9fe22ccf888d5621`.

Nakamura explicitly rationalizes the cohomology before constructing the unique retraction. His modular-form weight is this packet's polynomial degree plus two. His full-level arithmetic curve contains all geometric components; a group-cohomology carrier for Γ(N) models one connected Betti component. His dual symmetric-power local system has to be identified with the packet's adjugate polynomial action with the determinant twist recorded. The usual/adjoint relation in Lemma 3.1 is T′_ℓ=ℓ^k T_ℓ S_ℓ⁻¹ and S′_ℓ=ℓ^(2k)S_ℓ⁻¹ in this packet's notation.

Elkik's proof is for the trivial local system, hence weight two. Choose a prime ℓ ≡ 1 mod N. The boundary eigenvalue is ℓ+1; the Petersson norm argument excludes that eigenvalue on cusp forms without Deligne. Native `Nat.exists_prime_gt_modEq_one` supplies the prime. Cayley–Hamilton produces the parabolic annihilator, coprime to X−(ℓ+1). The exact normalization is still part of the geometric/coefficient comparison request.

Sharifi's higher-weight rational splitting cites Shokurov, *Shimura integrals of cusp forms*, Izv. Akad. Nauk SSSR Ser. Mat. 44 (1980), 670–718, 720, for the rational left kernel of the integration pairing. **That primary source has not been read.** Neither its exact cohomological transport nor the coprime-annihilator statement is declared source-closed. Elkik's proof must not be extended to arbitrary k without establishing the additional inputs.

The algebraic construction after separation is explicit: if aF+bG=1, e=b(A)G(A) has range in P and fixes P. Equivariance follows from commutation with A. For another equivariant retraction t, t(1−e)=a(A)|_P F(A)|_P t=0, so t=e with codomain P. This also proves conditional naturality. Rational coprimality need not be integral coprimality.

## Library, supplier and overlap audit

Read the reviewed library audit, the accepted RS-08 keeps/boundaries, ModularForms Layer 8 and the relevant upstream Hecke, lattice and dimension interfaces. Existing roadmaps retain ownership. The 30 relevant link records were examined: 28 were negative records, and the two positive links did not supply this splitting. No competing blueprint construction of it was found.

Seven baseline declarations were newly read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and added with their exact modules: `CongruenceSubgroup.Gamma`, `Algebra.adjoin`, `IsCoprime`, `LinearMap.aeval_self_charpoly`, `Submodule.projectionOnto`, `LinearMap.isCompl_of_proj`, and `Nat.exists_prime_gt_modEq_one`. The previous 46 baseline references retain their prior provenance; this checkpoint does not claim a new audit of all inherited source mathematics. Tau Ceti remains pinned at `f790474821cf4256814db967cb154e7af3d0c369`.

Two supplier requests were added:

- **ModularCurvesPartII R14.3:** all-component full-level Betti/group/étale comparison with rational symmetric-power coefficients, the coefficient-system dictionary, ordinary/parabolic comparison, usual/adjoint Hecke normalization, and real/Galois actions. Its current `betti-modular-symbols` node covers weight two at Γ₁(N); that is not the requested full-level higher-weight interface. The splitting itself belongs here, not to R14.3.
- **ModularForms 10C:** the weight-two full-level dimension instances dim S₂(Γ(3))=0 and dim S₂(Γ(6))=1, used by the zero and nonzero retraction tests.

The existing thirteen requests remain. Distribution spaces, admissibility, bounded measures and finite-slope functional analysis stay with LocallyAnalyticDistributions/PadicMeasuresIwasawaAlgebras. General critical and secondary L-functions stay with PadicFamilies L3 under RS-08.

## Where the next worker should resume

1. **Close the two recorded L0 mathematical gaps.** Obtain and read Shokurov's primary result; identify its rational-kernel theorem exactly and prove the route to higher-weight rational separation. Reconcile the full-level local systems and Hecke actions with R14.3, distinguishing one Betti component from the full arithmetic curve. Then type the real and p-adic Galois compatibilities against those genuine carriers. Preserve rationalization before splitting.
2. **Complete signature coverage across all five layers.** The previous L0–L3 `source_decomposed` statuses overstated completion: many API names and tests were missing as typed declarations, and most L1–L4 interfaces were only comment outlines. A comment-stripped short-name inventory finds 123 packet API/test names lacking a corresponding declaration: L0 59, L1 15, L2 33, L3 7, L4 9 (57 API names and 66 test names). Some mathematical examples are anonymous; this name audit is not a claim that every such statement is absent. Match every packet definition, API and named test to an actual signature/example, using the supplier's hypotheses. The newly added splitting names pass this audit. Elaborating a file never checks its comment-only signatures.
3. **Finish L4's actual missing targets.** Source coefficient embeddings of forms and their periods, and primitive/imprimitive level change with the ℓ-Euler factors. Mazur–Tate–Teitelbaum has not been read. RJW §§6–8 are about Kubota–Leopoldt and do not provide this material. Distinguish embeddings inducing the same p-adic place from different places when comparing slopes. Both refinements and worked supersingular examples are already planned; a general Sprung ♯/♭ decomposition was an unnecessary expansion of the target and is no longer required. Type the half-logarithms, their full API/tests, and the remaining L4 statements.
4. **Keep the inherited normalization checks and source issues visible.** The divided-power lattice matters for integral polynomial duality when k! is not a unit. The twisted Mellin formula uses χ̄ and the parity sign; the p-adic distribution uses the cusps −a/pⁿ and the n=0 Euler factor. E1–E8 concern Pollack–Stevens. E9 concerns Bellaïche's arXiv-v1 factors for f_β, printed with α. Check E9 against the published Inventiones text before claiming that the journal version has the same misprint.

The definitive objects, normalization formulas and all nine inherited source issues are in the packet and README. Earlier source reads retain their provenance: Pollack–Stevens §§2–6 and §8.4; Wiese §§1,4–7; Pollack AWS §§2,6; Bellaïche §1.4; RJW B.1; and Pollack Duke §§1–5,7. No new source issue is asserted by this checkpoint.

## Checks and totals

`check_blueprint.py` with the pinned declaration index: **0 errors, 0 warnings**. `intake.py check-files`: **four permitted files, 0 problems**. `git diff --check`: clean. The final suggested Lean file elaborated with `lean-check` against the shared pinned Mathlib build: **exit 0, 0 errors, 90 warnings, all declaration-uses-`sorry` warnings**. Available memory was above 20 GB before each check. These are proposed statements, not proved roadmap implementations. It imports Mathlib, while Tau Ceti results are source-backed references in the packet.

The rational model and integral obstruction were separately verified by scratch Lean proofs with no `sorry`: the projector identities by linear-map extensionality and rational arithmetic, and the integral contradiction by additivity, ℤ-linearity and `omega`. The deliverable retains the required proposed signatures with `sorry`; no roadmap implementation is claimed. There is no dependency on scratch files for resumption.

**Totals:** 59 nodes (8 definitions, 11 lemmas, 14 constructions, 21 theorems, 2 comparisons, 3 applications), 92 API items, 71 unit tests, 18 planets, 53 baseline declarations, 15 requests, 2 explicit mathematical gaps and 9 source issues. Five layers are in scope; none is declared closed.
