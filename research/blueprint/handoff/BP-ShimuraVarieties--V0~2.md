# BP-ShimuraVarieties--V0~2

Completed revision of issue #7010 by Codex (GPT-6), session `codex-OFHefX`, on 10 October 2026. This is a finished target-level planning pass, not a checkpoint. The packet is `complete`; V0–V7 are all `planned`, and no stage is `closed`. All implementation statuses remain `unchecked`.

## Deliverables and counts

The packet, reader and suggested file agree on 69 retained nodes: 60 theorems, 6 definitions and 3 constructions; 58 API items; 29 discriminating mathematical test specifications; 41 planets; and 5 pinned baseline declarations. There are 19 explicit proof/carrier refinements and 20 supplier requests. Each definition/construction has its uses, API and at least three tests. No node identifier was added, removed or renamed.

| Stage | Nodes | Coverage |
| --- | ---: | --- |
| V0 | 6 | planned |
| V1 | 6 | planned |
| V2 | 9 | planned |
| V3 | 7 | planned |
| V4 | 8 | planned |
| V5 | 12 | planned |
| V6 | 7 | planned |
| V7 | 14 | planned |

The existing independent `review` object is preserved exactly as instructed, including its historical `needs_changes` verdict and per-node ledger. It describes the pre-revision input; the next independent reviewer replaces it. This revision does not certify its own review.

## The two rejected specification points are repaired

`V2/analytic-automorphic-ring` now defines its boundary predicate from the primary Baily–Borel article, §§8.2–8.5, pp.509–511. In every rationally transported standard unbounded realization, the canonical-section coefficient extends continuously to the rational boundary component in the subspace Satake topology, with holomorphic boundary value. The equivalent local predicate requires continuity over a good neighborhood and holomorphy on each incident rational stratum. The topology is provided by the earlier `satake-compactness` node, not by the subsequent analytic or algebraic compactification. Product domains and compact factors follow §8.9, pp.512–514.

The ambient Jacobian induces the boundary factor. Restriction does not generally have the same intrinsic canonical degree on a lower-dimensional boundary domain. The API retains the actual normalizer action on this factor; descent to the effective boundary arithmetic group keeps the common-power/finite-character qualification. Added `integral_iff` and `change_chart` APIs identify the two predicates and their chart independence. Added tests exclude the cusp pole of the weight-zero j-function and distinguish ambient genus-two weight 3n from intrinsic genus-one weight 2n. The existing constants, weight-2n and noncuspidal E₄ at Γ(3) tests are retained.

`rational-boundary` and `satake-compactness` now expose the rational-normalizer criterion, adapted projection and Jacobian factor, good neighborhoods, and rational incidence required by that definition. The proof plan cites Theorem 8.6 for boundary restrictions, §§8.7–8.9 for interpolation/separation, §10.4 for the normal analytic structure and §§10.6–10.11 for projective realization. The full admissible section ring must still be identified with the section ring of an appropriate ample power: a finite separating subring alone does not establish its finite generation. That is an explicit proof refinement, not a missing definition.

The reader has been synchronized with all corrected packet statements, hypotheses, acceptance checks, APIs, tests, planets, supplier requests and source findings. The old boundary-definition gap is removed, V2 becomes planned, and stale reader-synchronization obligations are removed from the active gap register.

## Corrections retained from the independent review

The reader and suggested omission manifest now retain these corrected conventions and their examples:

- AA.4 owns neat normal cofinal sublevels. V0 only bridges its rational-conjugate convention to D5. The component formula retains the positive rational image ν(G(Q)₊)=T(Q)∩ν(Z(G)(R)) and qualified derived-group strong approximation.
- A normal level inclusion supplies an effective quotient-action subgroup. The disconnected norm-G_m example K(21)⊂K(3) has C₆ acting on six points over one, while the full automorphism group is S₆. The Hecke span retains its two target directions and the precise Cartesian hypothesis.
- Canonical models quantify over every actual special pair and representative. The split two-point model at K(5) fails the cyclotomic permutation. Finite continuous Galois-set descent is imported from ModularCurves Layer 0D. All review-added construction/extensionality APIs are included.
- Full CM allows products and retains degree 2 dim A, fixed-s quasi-isogeny uniqueness, geometric Artin normalization, polarization multiplier and Tate twist. Potential good reduction uses semistability, square-zero inertia in the reduced CM algebra and NOS. Absolute inertia is not assumed virtually pro-p.
- Connected data use S→Gᵃᵈ_R. The PGL₂ cocharacter need not lift to SL₂. Connected towers are pro-objects; their completed symmetry and adelic/Galois extension remain distinct requirements. The Serre action and marked cocharacter are in Tᵃᵈ. The corrected SL₂/Q(i) conjugation and distinguished finite-local marked-torus tests are included.
- General conjugation retains the actual contracted-product target, marked comparison, completion equivariance, independence, cocycle, finite rigidity, continuity and effective descent as separate steps. Propositions 14.14/14.16 and the final 14.15 reconstruction reference are synchronized. Semisimple rank-one perfection does not prove the printed assertion about the full reductive root subgroup; its central marked-torus bridge remains a gap.
- All fourteen source findings and individual verdicts are present: thirteen confirmed and E8 rejected. E8 is not presented as an established error in SVI's convention-specific analytic category. The general CA.0 foundation nevertheless includes nilpotents and scheme-valued GAGA.

## Current upstream ownership and source evidence

The read-only current TauCetiRoadmap checkout was screened at `dea8191cc6047d6142a65872ebce6eeeb841a29b`; the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` was also screened. These are separate checks from the pinned baseline. The current ReductiveGroups and AdicSpaces reader documents were read in full; the relevant AdelicAlgebraicGroups, ReductiveGroups Part II and ModularCurves specifications/signatures were checked for ownership. The nine roadmaps newer than the atlas snapshot were included in the current screen. No library implementation of the advanced Shimura boundary/canonical carriers was claimed.

Current AA §3.4 and `Reduction.levelArithmetic_commensurable_pair` already plan arbitrary compact-level/representative commensurability. The request now concerns the faithful-integral arithmetic definition and effective arithmetic-image comparison. Current AA §4.5 already plans integral abelianization lifts via Lang/Hensel, finite-adelic abelianization and class-set abelianization. Those are imported; only rational component positivity and local openness remain requested here. General finite-free Weil restriction is imported from current ReductiveGroups Part II; the request names its needed norm/cocharacter compatibilities. Nothing in the upstream checkouts was edited or built.

The new primary source is Baily–Borel, Annals 84:3 (1966), pp.442–528: [publisher record](https://annals.math.princeton.edu/1966/84-3/p11), [published-article OCR reproduction read](https://paperzz.com/doc/6992794/compactification-of-arithmetic-quotients-of-bounded-symme...). The packet records exactly the inspected sections and access limitations. The prose definitions, local/global extension equivalence and induced-factor distinction were readable. Some display signs are lost in OCR, so the remaining convergence estimates and complete proof interfaces still need a legible primary text. The canonical pullback sign is stated directly and checked by the modular/Siegel calculations.

The eleven inherited source-copy hashes and 6 October reading records are preserved; they are not relabelled as new reads. The current upstream AA source and the primary Baily–Borel read have separate 10 October provenance. No verbatim source passages, source PDFs or extracted book text were added to the repository. All source findings are paraphrases or mathematical formulas at exact locators.

The five full native declarations were re-read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: orbit setoid, orbit quotient, stabilizer, schemes and the fixed-base category. The Tau Ceti baseline remains `f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti declaration is among these five citations.

## Remaining closure work and where to resume

The 19 numbered reader gaps are the worklist. Supplier requests are mathematical interfaces, not new issue claims or messages to owners.

- V0–V1: supply CA.0 nilpotent analytic spaces, holomorphic gluing and analytification; the faithful-integral/effective arithmetic image; central-unit-aware covering/freeness; positive rational abelianization and local openness. Existing AA reduction, commensurability, neatness and integral lifts must remain imports.
- V2: certify adapted-domain/reduction-topology interfaces, Poincaré–Eisenstein majorants, the §9 analyticity criterion/local normal models, full admissible Veronese section-ring identification, Koecher and finite-index boundary-map/integrality proofs. The exact boundary predicate is already specified and should not be reopened as a vague growth placeholder.
- V3: obtain the complete multivariable Borel metric proof, the independent PS/KUY arithmetic-to-algebraic definable comparison and graph suppliers, SNC compactification and the general normal quasi-projective finite quotient interface. Keep the BKT erratum hypotheses.
- V4–V5: supply arithmetic real-density/torus and reflex-norm interfaces, full CM spreading/rigidity and positive-characteristic Hom/Tate specialization; CFT Part II `CFT.N` owns the generic Chevalley unit-topology and cyclic Hasse-norm inputs. Existing ModularCurves 0D and generic Siegel moduli remain imports.
- V6–V7: construct the connected adjoint carrier and Deligne §§2.7.10–2.7.13 full symmetry/coherence; supply CM Part II `CM.S` for the Serre/Taniyama extension and adelic cocycle; certify exceptional Kazhdan and ranked S-arithmetic inputs, corrected centre cohomology, rank-one central marked-torus comparison, A₁ comparison and completion density.
- Restore advanced Lean signatures only when these owners provide their actual carriers. The exact 69-node/58-API/29-test manifest is already synchronized. All advanced implementation statuses remain unchecked.

The CA.0 proposals for RT-AREA-algebraicgeometry/3 and /28 remain unapplied: consumer edges and PR196/279 external records require their owning jobs. Current atlas V1 wording also needs to distinguish the effective quotient-action subgroup from the full deck group. The V8 conditional uniqueness/disjoint-reflex-field foundation should move to the V4 lane at assembly with identifiers preserved by aliases, avoiding a misleading stage cycle. This four-deliverable job applies none of those foreign-file changes.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraVarieties--V0.json`: 0 errors, 0 warnings; 8 planned, 0 closed stages.
- Source-finding and source-version validators: passed for 14 findings and 13 source-version entries.
- Cross-file check: all 69 statements, 58 API items and 29 tests occur verbatim as our own mathematical specifications in both reader and omission manifest; all node IDs and the independent review object are unchanged. Native Lean bodies are unchanged.
- `lean-check research/blueprint/suggested/ShimuraVarieties--V0.lean`: exit 0, 23 `sorry` warnings, no other warnings/errors. Memory was checked first (97 GiB available). The shared wrapper used Mathlib `082e2d37e8`; only Mathlib imports are used. No exact-pin Tau Ceti integration or omitted advanced theorem is certified by this compilation.
- Permitted-file intake and `git diff --check`: passed. The submission contains only the three named deliverables and this handoff. Remote submission-check results belong to the pull request.

Resume with the independent revision review, then the named owner/proof refinements and assembly. This worker submits one job and takes no further claim.
