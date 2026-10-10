# BP-CrystallineCohomology--CR.0~2 — completed revision pass

Refs #6951. Agent: Codex, session `codex-m29g7d`. Claim confirmed by the bot in [comment 6093256726](https://github.com/CBirkbeck/tauceti-explorer/issues/6951#issuecomment-6093256726). Branch: `codex-m29g7d-crystalline-revision`. Starting atlas commit: `367b1059c`.

This is a complete target-level planning pass, ready for independent review. It is not a checkpoint or a proof-closure claim. All 164 reviewed node ids are retained, with 22 additions. The packet's existing top-level `review` object is unchanged; only the independent reviewer may replace it. Every implementation status remains `unchecked`.

The packet, reader and suggested file are the three other deliverables of this issue. The reader was regenerated from the revised packet, in prerequisite order within each layer. It contains every node statement, hypothesis, proof route, acceptance item, API item and test verbatim from our own packet wording, with source locators. This synchronization does not insert verbatim source passages. All source excerpts were removed, and source-issue diagnostics and reasons were restated in our own words while preserving their findings and verdicts.

## Coverage and counts

The packet is `complete` under PROTOCOL §0: every target is represented, and prerequisite chains end in baseline declarations, existing owner nodes, exact supplier requests or named proof gaps. No stage is `closed`.

| Stage | Status |
|---|---|
| `CrystallineCohomology:CR.0` | planned |
| `CrystallineCohomology:CR.1` | planned |
| `CrystallineCohomology:CR.2` | planned |
| `CrystallineCohomology:CR.3` | planned |
| `CrystallineCohomology:CR.3:Frobenius-isogeny` | planned |
| `CrystallineCohomology:CR.3:duality` | planned |
| `CrystallineCohomology:CR.4` | planned |

There are 186 nodes: 23 definitions, 57 lemmas, 49 constructions, 43 theorems, 13 comparisons and one application. They contain 359 API items, 254 unit tests and 31 planets; no layer has more than six planets. The packet cites 154 baseline declarations and 25 sources, retains 66 source findings, and records 41 proof gaps, 21 supplier requests and 15 restructuring entries. The 31 incoming contracts identified by the review remain individually accounted for in coverage, including their unmet extensions.

The prototype inventory reports 121 executable node declaration names, 255 executable API names and 182 labelled executable tests. Of the 186 inventories, 110 contain every requested name, 11 contain some and 65 have no requested executable component. Name presence does not certify full statement strength or proofs. The exact omitted mathematical statements are recorded in `signatureCoverage.entries[].missing` and the final Lean comment register. Known strength differences are recorded in `prototypeNote` and reproduced in the reader.

## Added targets and foundations

- `CrystallineCohomology:CR.0/envelope-etale-extension`: Étale extension of PD envelopes.
- `CrystallineCohomology:CR.1/etale-crystalline-site`: The étale crystalline sites.
- `CrystallineCohomology:CR.1/etale-crystal-comparison`: Change of topology for quasi-coherent crystals.
- `CrystallineCohomology:CR.2/smooth-ambient-linearization`: Linearization in a smooth ambient scheme.
- `CrystallineCohomology:CR.2/smooth-ambient-comparison`: De Rham computation in a smooth ambient embedding.
- `CrystallineCohomology:CR.2/filtered-pd-comparison`: Filtered PD Poincaré lemma and comparison.
- `CrystallineCohomology:CR.2/cech-alexander-global`: Čech–Alexander totalization and refinements.
- `CrystallineCohomology:CR.2/higher-direct-image-vanishing`: Positive PD forms vanish after crystalline projection.
- `CrystallineCohomology:CR.3/mayer-vietoris`: Mayer–Vietoris for crystalline cohomology.
- `CrystallineCohomology:CR.3/etale-hypercover-descent`: Descent along étale hypercovers.
- `CrystallineCohomology:CR.4/principal-p-decalage`: Principal p-décalage on torsion-free complexes.
- `CrystallineCohomology:CR.4/p-bockstein`: Bockstein reduction of principal p-décalage.
- `CrystallineCohomology:CR.4/derived-p-decalage`: Derived p-décalage and completion.
- `CrystallineCohomology:CR.4/witt-structural-identities`: Structural identities on the existing p-typical Witt vectors.
- `CrystallineCohomology:CR.4/witt-frobenius-lift-universal`: Witt lifting from a torsion-free Frobenius lift.
- `CrystallineCohomology:CR.3/smooth-curve-lift`: Smooth proper lifts of curves over Witt vectors.
- `CrystallineCohomology:CR.3/crystalline-leray`: Crystalline Leray spectral sequence.
- `CrystallineCohomology:CR.3/top-coherent-differential`: Vanishing of the top coherent de Rham differential.
- `CrystallineCohomology:CR.3/elliptic-frobenius`: Ordinary and supersingular elliptic crystalline Frobenius.
- `CrystallineCohomology:CR.3:duality/finite-etale-transfer`: Finite étale crystalline transfer and trace.
- `CrystallineCohomology:CR.4/isocrystal-slope-decomposition`: Slope decomposition on the existing isocrystal carrier.
- `CrystallineCohomology:CR.4/perfectoid-witt-base-change-input`: Finite Witt base change for integral perfectoid rings.

The filtered PD comparison uses the level-zero case of Le Stum–Quirós, with p in the base PD ideal, p nilpotent on the base and finite locally free coefficients. The ambient computation explicitly uses smooth embeddings, their PD envelopes and product-embedding comparisons. General descent here means bounded-below Zariski/étale hypercover descent, not arbitrary proper-h descent.

The elliptic examples use the already owned finite-field isogeny relation and rank-two crystalline cup form: y²=x³+x over F₅ has polynomial T²−2T+5 and slopes 0,1; y²=x³−x over F₃ has polynomial T²+3 and slopes 1/2,1/2. Their point-count tests are typed, but the crystalline comparison and slope assertions remain mathematical contracts. No general crystalline realization of p-divisible groups is used to establish these examples.

The new principal p-décalage and Bockstein prototypes operate on the actual pinned cochain carrier. The normalized differential is d/p; α_F has components pⁿF in nonnegative degree. The Bockstein prototype uses an explicit quotient of lifted mod-p cocycles, with its representative formula, square-zero differential, comparison map and tests for differentials p and p². Identifying that quotient with the pinned homology object remains an additional interface; compilation does not prove this identification. General enhanced Lη_p and its fixed-point category retain their exact categorical input contracts and gaps.

## Decisions on the second reading

| Review point | Decision in this revision |
|---|---|
| Regular-envelope (1)(c,d) | Reread Bhatt §§3.37–3.38. Keep individual non-zero-divisor hypotheses for principal envelopes and their two-term resolutions. Record positive-power regularity and Koszul syzygies as DD.1 contracts. The mixed sequence is used for Tor vanishing. Flat Z/pⁿ reduction still has an exact algebra proof input. |
| Filtration under maps | Remove ring surjectivity from the packet and the typed filtration equality. The sufficient hypothesis is I.map f=J. Include a non-surjective Z_p→Z_p[t] acceptance case. |
| Completed-envelope lift | Preserve the review's closed-target-ideal requirement. The typed hypothesis is K=⋂ₙ(K+pⁿC), rather than only p-nilpotence. An ideal containing a power of p is a special case. |
| Support square (B.10) | Make clause (3) conditional on compatibility of the supplied Sato map with the quotient comparison; retain the exact missing proof contract. Replace the uninstantiated test by X with two components and U one component. |
| Mayer–Vietoris / Leray / curve lift | Add explicit nodes. The Leray spectral sequence needs a bounded-below generic supplier contract; relative crystalline cohomology and the curve integral degeneration are still exact proof inputs. Do not use the torsion-surface node to prove its own Leray input. |
| Noncomplete smooth lift | Apply the complete-ring formal de Rham supplier to B̂, not directly to B. Record p-torsion-freeness, quotients, Frobenius extension and continuous-form comparison as the missing completion step. Remove the duplicate classical/relative agreement. |
| Finite étale Gysin test | Add finite-etale-transfer, including algebra trace, projection, composition, multiplication by the degree, compatibility with the top trace and agreement with duality Gysin. Reread Ekedahl I §2 (2.5)–(2.11), pp. 192–194, and §5, p. 198. |
| Imprecise API | Give domains, lengths, degrees and maps for continuousWitt_eval/map/operators and LogWitt.symbol. FCrystal.dual is the rational finite-locally-free dual, with inverse Frobenius and evaluation; an integral dual need not exist. |
| Site notation and Chern class | Distinguish the open base S_open from S′ and state u⁻¹G(U,T)=G(U), including restriction of units used by c₁. |
| Unused prerequisites | Remove the unused square-zero references from PD differentials, unused duality/comparison inputs and the higher Habiro truncated-Witt reference. |
| Test namespaces | Normalize every labelled prototype test to its packet namespace, including the four CR.0 groups mentioned by the review. |

## CR.0 envelope signature comparison

This comparison concerns signature strength, independently of whether a body is a proof placeholder.

| Group | Executable prototype and limits |
|---|---|
| PD polynomial | Uses Mathlib DividedPowerAlgebra on the free module. Relative ideal, universal map, monomial basis and multiplication are typed. Generic Γ grading/base change/free symmetric-tensor comparison is imported from upstream IHG §0.4. |
| Relative PDEnvelope | Explicit quotient carrier, lift, quotient ring equivalence, general map and its composition, generators and presentation are typed. The compatible lift uses the sub-PD ideal generated by J₀; separate lemmas identify its sum with the base ideal and its compatibility. Equal carriers are represented by ring equivalences and operation clauses. |
| Quotient/transitivity | The typed theorem gives the surjection in part (1), its PD-generated kernel, and compatibility on generators and powers. Sub-PD stability, the quotient PD structure, repeated quotients and parts (2),(3) are not separately typed. |
| Envelope base change | Neither tensor comparison is executable. The exact flatness/Tor hypotheses and canonical maps occur in the omission register. PDEnvelope.map alone does not type or prove the isomorphisms. |
| Localization | The A-algebra map, inversion of S and ordinary localization universal property are typed. The PD fraction formula is a separate TauCeti.PD signature. PD compatibility of this map, the tensor equivalence and simultaneous base localization are additional untyped clauses. |
| PD filtration/nilpotence | Actual PD-filtration ideal and PD-nilpotence predicate are typed. The filtration equality no longer assumes surjectivity. pdNilpotent_map still has an unnecessary surjectivity hypothesis; its stronger packet contract follows using the strengthened filtration equality. |
| Regular envelope | regularEnvelope types the characteristic-p module basis for the full ideal. PDEnvelope.presentation types the general presentation with all relations. The (K)-criterion simplification, principal tensor comparison, Tor/Koszul clauses and flat Z/pⁿ assertion have no executable signature. |
| Completed envelope | Uses the pinned adic completion carrier. Closedness is typed explicitly. The finite reductions and compatible-family inverse-limit property are typed; the derived-completion comparison depends on DD.1. |
| Fontaine envelope | Built from existing fontaineTheta and the completed relative envelope. The explicit description assumes the primitive-kernel/non-zero-divisor hypothesis. The initial map starts with a given incoming Witt map; it is not universality among all semiperfect PD thickenings. |
| Canonical p powers / compatibility / variables | Canonical coefficients are represented by canonicalPCoeff; agreement with PadicInt.dividedPowers and p=2 detectors are typed. Compatibility and adjoining variables use their respective mathematical carriers. |
| Square-zero extension and thickening | Reuse TrivSqZeroExt for A⊕M. The three-component thickening uses its actual bilinear multiplication, with ε²=2η and ε³=0 in the integral detector; it is not ℤ[ε]/ε³ with the usual basis. |
| PD-ring pushout | The PD-ring category and colimit signature are typed. The pushout theorem assumes a categorical pushout, then states quotient tensor equivalence, surjectivity and ideal generation. The existence proof still depends on limits/representability. The incompatible Z/4 powers test forces the PD pushout to F₂. |
| Étale envelope extension | New full mathematical contract, finite-level comparisons and completion by inverse limit; its executable signature remains in the omission register. |

The existing sum-uniqueness signature gives one direction; restriction and existence lemmas supply the other direction mathematically. Sheaf/topos, global connection and several de Rham–Witt signatures elsewhere remain narrower as recorded by the prior review and this inventory. No comment-only form is counted as elaborated Lean.

## Ownership and structure for the manager

Current TauCetiRoadmap main was inspected at `dea8191cc6047d6142a65872ebce6eeeb841a29b`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing upstream roadmaps were read in place; neither checkout was built or edited. Current JacobianChallenge and AlgebraicVectorBundles supplied style and ownership checks. IntegralHeckeAndGaloisDeterminants §0.4 and its Suggested declarations already plan Γ grading, arbitrary base change and free Γ^d–TSym. These are cited through atlas owner IHG.0, with an explicit upstream contract, not added as purported baseline Lean declarations.

The latest RS-01 proposal's review is pending. This revision therefore keeps the currently integrated seven-stage scope. Historical provenance mentions earlier accepted restructuring; that does not accept the latest proposal.

The manager must point higher consumers at these earlier owners:

- Principal p-décalage, Bockstein and derived p-décalage: the three new CR.4 nodes, replacing the higher AI.1 import. General variants can remain at their owners.
- Finite p-typical Witt identities on Mathlib carriers: CR.4/witt-structural-identities, replacing HabiroRings. The draft QWittVectors roadmap is not an upstream supplier; arbitrary-ring Witt étale base change is still a precise proof gap.
- The needed Frobenius-lift-to-Witt map: CR.4/witt-frobenius-lift-universal, replacing the higher PrismaticCohomology δ-ring universal package. No full δ-ring equivalence is claimed here.
- The needed isocrystal slope decomposition: CR.4/isocrystal-slope-decomposition, on the existing Mathlib Isocrystal carrier, replacing the higher PadicHodgeTheory import. Its full classification/descent proof remains open.
- Perfectoid finite-Witt input: CR.4/perfectoid-witt-base-change-input uses the lower PerfectoidSpaces P1 contract, replacing PerfectoidQuotients.
- Generic Γ^d–TSym comparisons in AbelianSchemesAndArithmeticModuliPartII should import existing upstream IHG §0.4. CR.0 adds the relative PD-base use, not a second generic comparison.
- Generic Tor-independent coherent base change and perfectness use lower SchemeAndStackFoundations SF.2; no SchemeKTheoryOperations dependency remains. The exact proper-flat Tor-amplitude contract is requested from AlgebraicModuliForArithmeticGeometry.
- Add the bounded-below Grothendieck spectral sequence to EnhancedDerivedSheaves, Part II, using its existing derived pushforward and truncations. The crystalline applications stay here.

The two existing logarithmic model nodes keep their current CR.4 ids and explicit CR.5/log-algebra and CR.5 requests. Their proposed placement is after those log foundations in CR.6. This is still a stage-placement decision for the manager: local node acyclicity does not certify the full stage graph after integrating every pending packet. No non-logarithmic CR.4 node uses those two nodes. Do not restore the removed higher dependencies or package this part while leaving the log stage-order issue unresolved.

Three incoming extensions need an owner decision: convergent F-isocrystals, absolute Hesselholt–Madsen Witt complexes over ℤ_(p), and the regular-Noetherian crystalline comparison of BLM Theorem 10.1.2. They are not silently identified with the presently stated relative Langer–Zink or smooth crystalline comparisons. All other incoming extensions are listed with exact omissions under each coverage record.

## Five confirmed red-team findings

- RT-AREA-padic-2/2: ordinary de Rham is imported from the actual DD.2/ordinary-de-rham-complex and its API. PD differentials and the PD complex are owned in CR.1. Strict odd-square vanishing is retained at p=2. The proposed historical DD.0 label must not override the current supplier node.
- RT-AREA-padic-2/8: relative Langer–Zink is over arbitrary ℤ_(p)-algebra bases, with continuous complexes, torus basis/integral part and perfectoid base change. p-nilpotence appears in the crystalline comparison only.
- RT-AREA-padic-2/12: classical/saturated comparison imports DD.3/smooth-cartier, with the smooth/perfect characteristic-p hypotheses and the distinct regular-Noetherian extension stated correctly.
- RT-AREA-padic-2/16: logarithmic Hodge–Witt sheaves are étale images of dlog, with exact lengths/maps in the Illusie and Shiho sequences. The supplier and proof gaps for regular extension and topology comparison remain explicit.
- RT-AREA-padic-2/36: DD.4 alone owns the derived-versus-classical lci comparison. CR.0 keeps the classical PD presentation, regularity, tensor and flatness inputs; it does not state the derived comparison.

## Sources and remaining proof inputs

The restricted-library index does not clear Berthelot–Ogus or Berthelot LNM 407. No uncleared copy was acquired or read. Public replacements establish narrower cases: Stacks, Bhatt–de Jong for affine/global crystalline computations, and Le Stum–Quirós for the filtered level-zero comparison. They do not establish all formal/non-affine quasi-nilpotent-connection or trace/purity statements of those books. Their exact remaining claims are recorded below. Acquisition was not substituted for proof inspection.

This run reread Bhatt §3.3; BLM §§2.3 and 7.2; the relevant Stacks divided-power, crystalline-site and comparison proofs; Bhatt–de Jong §§2–3; Le Stum–Quirós §§2–3 at level zero; Langer–Zink §§1 and 3 comparison/Frobenius; BMS1 §§2.2 and 3; Lurie Lecture 26; and Ekedahl's finite-étale trace passages noted above. Each packet source has a URL, pinned receipt and exact reading ranges. Earlier sourceInventory ranges are inherited historical readings, not a statement that every source was reacquired in this run. Illusie, Shiho, the other BMS sections and source-issue verifications retain the independent review's recorded readings and verdicts.

Lurie Lecture 26 states the full Dieudonné–Manin classification without proving it; Mathlib's existing result is only rank one. The special Witt lifting route still needs its integral-coordinate certificate. Sato, Swan, Morrow and portions of BLM/Langer–Zink listed by the review remain unacquired or unread. E510's existing duplicate finding is retained for the register manager; no new source-finding verdict is invented.

The following are the 41 exact gap titles and consumers. Resume at the matching `gaps[].title` in the packet for the full statement and proof obligation; each is also included in the corresponding coverage remaining list.

1. **Koszul inputs for envelopes of regular sequences** — `CrystallineCohomology:CR.0/regular-envelope`.
2. **Generator of the kernel of θ for an integral perfectoid ring** — `CrystallineCohomology:CR.0/fontaine-envelope`.
3. **Finite limits in the big crystalline site (Stacks Lemma 60.8.2)** — `CrystallineCohomology:CR.1/crystalline-site`.
4. **Exactness of i_! and the morphism π for non-affine X** — `CrystallineCohomology:CR.1/site-morphisms`.
5. **Composition of the morphisms of small crystalline topoi** — `CrystallineCohomology:CR.1/site-morphisms`.
6. **Quasi-nilpotence in étale coordinates** — `CrystallineCohomology:CR.1/quasi-nilpotent-connection`, `CrystallineCohomology:CR.1/finite-witt-evaluation`.
7. **Verifications omitted in Stacks Proposition 60.17.4 and Lemma 60.17.5** — `CrystallineCohomology:CR.1/taylor-equivalence`.
8. **Crystals and connections for a formally smooth lift (Stacks Remark 60.17.6)** — `CrystallineCohomology:CR.1/taylor-equivalence`.
9. **Crystals and connections on a non-affine scheme** — `CrystallineCohomology:CR.1/taylor-equivalence`.
10. **Crystalline cohomology as a derived limit over the reductions modulo p^e (Stacks Remark 60.24.10)** — `CrystallineCohomology:CR.2/crystalline-cohomology`.
11. **Smooth-lift comparison (Stacks Remark 60.24.11)** — `CrystallineCohomology:CR.2/smooth-lift-filtration`.
12. **Crystals on a proper smooth lift and Grothendieck existence (Stacks Remark 60.24.14)** — `CrystallineCohomology:CR.2/formal-and-end0`.
13. **Base change: envelope of a Koszul-regular sequence over a PD base, and Mayer–Vietoris (Stacks Remarks 60.24.2, 60.24.8, 60.24.9)** — `CrystallineCohomology:CR.3/derived-base-change`.
14. **Perfectness of proper smooth crystalline cohomology (Stacks Remarks 60.24.12–60.24.13)** — `CrystallineCohomology:CR.3/proper-perfectness`.
15. **Cohomological inputs for the torsion surface of BMS1 §2** — `CrystallineCohomology:CR.3/torsion-and-models`.
16. **Identification with the crystalline trace of Berthelot** — `CrystallineCohomology:CR.3:duality/trace`.
17. **Inputs of crystalline Poincaré duality** — `CrystallineCohomology:CR.3:duality/poincare-pairing`.
18. **Gysin maps: cycle class and base change** — `CrystallineCohomology:CR.3:duality/gysin`.
19. **Trace of an external product** — `CrystallineCohomology:CR.3:duality/diagonal`, `CrystallineCohomology:CR.3:duality/trace`.
20. **Inputs of the seminormalisation theorem (Swan; Popescu for discrete valuation rings)** — `CrystallineCohomology:CR.4/saturated-seminormalisation`.
21. **Special Witt lifting property used in the saturated complex** — `CrystallineCohomology:CR.4/saturated-de-rham-witt`.
22. **Witt vectors of an étale map (BMS1 Theorem 10.4)** — `CrystallineCohomology:CR.4/witt-localization-descent`, `CrystallineCohomology:CR.4/torus-integral-part`, `CrystallineCohomology:CR.4/perfectoid-base-change`, `CrystallineCohomology:CR.4/crystalline-comparison`.
23. **Illusie's results on the classical complex of a smooth algebra** — `CrystallineCohomology:CR.4/classical-regular-comparison`.
24. **Popescu's theorem for regular Noetherian F_p-algebras** — `CrystallineCohomology:CR.4/classical-regular-comparison`, `CrystallineCohomology:CR.4/logarithmic-witt-sequences`, `CrystallineCohomology:CR.4/saturated-seminormalisation`.
25. **Slope spectral sequence: finiteness and degeneration** — `CrystallineCohomology:CR.4/witt-slope-spectral-sequence`.
26. **Zariski and étale images of the symbol map** — `CrystallineCohomology:CR.4/logarithmic-witt-sheaf`.
27. **Smooth cases of the logarithmic sequences** — `CrystallineCohomology:CR.4/logarithmic-witt-sequences`.
28. **Hyodo–Kato complexes and the complex of Sato (cited by Disegni–Liu)** — `CrystallineCohomology:CR.4/semistable-log-witt-models`.
29. **Comparison maps of Sato and the square (B.10)** — `CrystallineCohomology:CR.4/log-witt-proper-support`.
30. **Limits and the representability criterion for PD rings (Stacks Lemmas 23.3.2, 23.3.3)** — `CrystallineCohomology:CR.0/pd-ring-pushout`.
31. **Frobenius between the crystalline sites over W_r(A) and W_(r−1)(A)** — `CrystallineCohomology:CR.4/degree-scaled-frobenius`.
32. **Tubes, specialization and convergent log de Rham–Witt complexes (Disegni–Liu Appendix B)** — `CrystallineCohomology:CR.4/semistable-log-witt-models`, `CrystallineCohomology:CR.4/log-witt-proper-support`.
33. **Fixed points of an endofunctor of an ∞-category and their mapping spaces** — `CrystallineCohomology:CR.4/leta-fixed-point`.
34. **Hodge and de Rham cohomology of projective space** — `CrystallineCohomology:CR.3/torsion-and-models`, `CrystallineCohomology:CR.3:duality/trace`.
35. **Completion before the formal de Rham comparison** — `CrystallineCohomology:CR.4/classical-regular-comparison`.
36. **Étale lifting and the crystalline change-of-topology proof contract** — `CrystallineCohomology:CR.1/etale-crystalline-site`, `CrystallineCohomology:CR.1/etale-crystal-comparison`.
37. **Certificate for the special Witt lifting property** — `CrystallineCohomology:CR.4/witt-frobenius-lift-universal`.
38. **Relative curve de Rham degeneration over Witt thickenings** — `CrystallineCohomology:CR.3/smooth-curve-lift`.
39. **Relative crystalline cohomology of an elliptic torsor** — `CrystallineCohomology:CR.3/crystalline-leray`.
40. **Trace on forms for finite syntomic Frobenius** — `CrystallineCohomology:CR.3/top-coherent-differential`.
41. **Full Dieudonné–Manin classification and descent** — `CrystallineCohomology:CR.4/isocrystal-slope-decomposition`.

The 21 outgoing contracts are stated in full in the reader's Supplier contracts appendix and packet `requests`, each naming its consuming nodes. They cover derived Čech/limits/cups/localization; Koszul and completion/perfectness; proper-flat coherent cohomology; current upstream curve and elliptic theory; étale lifting, pro-étale pullback, support, shriek and biduality; log algebra/sites; IHG's already planned Γ input; and the bounded-below Leray spectral sequence. An accepted supplier statement is a planning dependency, not a proof that its implementation exists.

## Validation and next step

- `python3 scripts/check_blueprint.py research/blueprint/packets/CrystallineCohomology--CR.0.json --index <pinned-declaration-index>`: zero errors and zero warnings, with the actual pinned declaration index.
- Semantic checks: unchanged top-level review; preservation of all 164 ids and exact seven-stage scope; local prerequisite DAG; a precise request naming every consumer of an external stage; reader parity for all node/hypothesis/proof/acceptance/API/test statements; exact omitted-signature register; no active references to the removed higher roadmaps; source-version checks on all 66 findings; no source excerpts or private paths; no Lean code in the packet or reader.
- `lean-check research/blueprint/suggested/CrystallineCohomology--CR.0.lean`: exit 0, no errors, 744 warnings, all `declaration uses sorry`. Available memory was 103 GB before compiling. No lake build, update, cache download or language server was used.
- Suggested file SHA-256: `2ceb375b825789367a5e3888789faaaeb38641c26511d126d91a6fa3d36c5520`.
- Four-file intake and `git diff --check` are recorded in the PR. Only the four issue deliverables are submitted; no source PDF, extracted source text or scratch script is committed.

The next job is independent review of this revision, especially the new filtered/étale contracts, the elliptic characteristic-polynomial argument, the moved foundational ownership and the explicit narrower prototype forms. Proof closure must address the 41 named inputs and 21 supplier contracts. Packaging also needs the manager's log-node placement and incoming-extension owner decisions. The worker stops after opening this issue's PR and does not claim a second job.
