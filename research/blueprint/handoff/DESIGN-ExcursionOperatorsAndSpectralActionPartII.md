# DESIGN-ExcursionOperatorsAndSpectralActionPartII

Issue: #4486. Worker: Codex, session `codex-s6reGX`, 2026-10-19.
Branch: `codex-s6reGX-stable-bernstein-center`.
The claim was confirmed by the bot after [the claim comment](https://github.com/CBirkbeck/tauceti-explorer/issues/4486#issuecomment-6259167350).

This is a complete target-level design under PROTOCOL section 0, ready for independent review. All seven layers SC0–SC6 are **planned**, none **closed**. Every node remains `implementationStatus: unchecked`. The packet has 28 nodes: 4 definitions, 5 constructions, 2 lemmas, 15 theorems, 1 comparison and 1 application; 45 API items, 36 definition tests, 23 planets and 16 pinned-library declarations. It has 10 existing-stage requests and 3 explicit gaps. This submission is a complete plan, rather than a checkpoint or an implementation claim.

The four issue deliverables define one continuation of ExcursionOperatorsAndSpectralAction. They merge the Hansen stable-center route with the FS conjectural boundary, without adding the latter as a theorem. The proof route includes both stable-center notions, character faithfulness, directed Euler-class Hecke operators, dual-root weight equidistribution, the discriminant-weighted averaging and cuspidal pairing estimates, rank induction for very stability, atomic-parameter constancy, and the inner-form image-center map with its Levi, character and test-function compatibilities.

The current upstream ReductiveGroups, RootSystems, LieHighestWeight and SmoothRepresentations roadmaps and the current Tau Ceti library were inspected before planning. The reviewed base-roadmap library audit was also read. The ordinary center, normalized induction, semisimple parameters, generic spectral/Hecke machinery and Weyl formulas are imported, not replanned. Every baseline declaration was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. In particular, an Artinian-ring simple-class basis is not treated as a p-adic smooth-character theorem.

## Closure work for the reviewer and supplier jobs

- **G1:** The accepted `SmoothRepresentationsCharactersPartII` route has no defined or reserved stage IDs. Its precise harmonic-analysis contract is in the packet and reader: character independence/K_0, Arthur decompositions, elliptic restriction, stable separation/projection, stable delta at the identity, analytic bounds, cuspidal Weyl integration and stable inner transfer. Give these real supplier addresses before closing consumers. The existing unitary/Fell-topology Part II is a different continuation.
- **G2:** The accepted `HeckeStacksAndLocalShtukasKottwitzPartII` route likewise lacks addressable stages. Supply finite length and the elliptic formula for the exact basic-stratum shriek composites in both directions, with invariant-fiber existence/uniqueness. HKW states its Mant functor with star extension; the supplier must establish the adapted shriek formula using the relevant duality and inversion comparisons, with shifts and signs. Do not replace this by a global equality of star and shriek extensions or add refined-LLC hypotheses from a different HKW theorem.
- **G3:** Verify full arbitrary-coefficient atomicity of regular supercuspidal packet sums under exactly Hansen Corollary 1.3's tame and prime-to-Weyl-order hypotheses. The inspected FKS v2 also assumes exponential convergence and states stability/endoscopy, rather than the needed support-minimality theorem. Publisher full text of the 2023 version of record was not obtained; this is a source-verification gap, not a verdict that the published corollary is false. It affects only the regular-packet application.

Discharge R1–R10 against the listed existing stages or their exact future nodes. R9 must include the algebraic-group/Lie highest-weight dictionary needed to use the existing LieHighestWeight Weyl formula. The packet's `remaining` entries track these obligations for every layer, including transitive gaps.

The restructure proposals preserve the two accepted supplier directions and reconcile the historical route name `ExcursionOperatorsAndSpectralActionStableCenter` with this issue's `ExcursionOperatorsAndSpectralActionPartII`. No mathematical ownership was moved from an existing roadmap. No supplier IDs were invented.

## Source and mathematical checks to retain

Hansen's published 2026 article was read in full. Relevant passages were read in Fu v1, published HKW, FS v4 and FKS v2; exact sections, pages, URLs, read dates and SHA-256 hashes are in the packet. FKS v2 must not be represented as the published version. No private book or source passage is included in the repository.

Two previously recorded Hansen misprints are retained as source issues E1/E2 with corrected targets: the reverse-Hecke identity-basic-stratum index, and the dual-root/coroot convention in the averaging sequence. No independent-review verdict was copied into this packet. The B2 computation distinguishes roots from coroots. Atomicity tests distinguish arbitrary coefficients from partial sums. The compact-representative lemma avoids an incorrect compactness assertion about whole conjugacy orbits. The main stability proof uses a stable projection without first assuming stability of the character being tested. Reverse Hecke is compared modulo induced characters, not assumed elliptic. The map tau has the FS **image algebras** as domain and codomain. Parameter continuity retains the imported coefficient topology before transport by iota. The usual distribution pairing is pinned explicitly: (z*f)(1)=z(f^vee). The stable-annihilator and faithfulness arguments therefore use f^vee; the module argument uses the corresponding involution on central distributions.

## Validation

- `scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings; all seven stages planned.
- `research/blueprint/intake.py check-files`: allowed deliverable paths, valid JSON and no local paths.
- `scripts/check_sorry_data.py` on the suggested file: passed.
- Reader/packet/roadmap checks: all node IDs, API items and definition tests present; test kinds match PROTOCOL section 12; at least three tests per definition/construction; scope and stage IDs agree; no source-excerpt field.
- `lean-check research/blueprint/suggested/ExcursionOperatorsAndSpectralActionPartII.lean`: exit 0 at the pinned shared build, with only 13 expected `sorry` warnings. Memory was checked before compilation. No background compile remains.

The 128-line suggested file has one real-bodied light definition on existing Finsupp/Submodule carriers, three representative endpoint signatures and ten examples. Heavy p-adic carriers and geometric constructions remain fully specified reader targets, following the current WORKERS shape rule. The Lean check does not establish the mathematics or close any layer. The final staged diff must pass `git diff --cached --check` before submission. Job scratch is disposable once the pull request is open; all continuation information is above and in the deliverables.
