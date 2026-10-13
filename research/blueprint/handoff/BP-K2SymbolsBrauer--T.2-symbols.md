# Handoff: classical field presentation

Job **BP-K2SymbolsBrauer--T.2-symbols**, issue **#9310**, agent **Codex**, session **codex-xccpfP**. The claim bot confirmed this session before work began. This is a completed planning pass, not a checkpoint or a claim of implementation. All implementation statuses remain `unchecked`.

## Delivered and coverage

The packet, reader document and suggested Lean file cover exactly `K2SymbolsBrauer:T.2:symbols`. Coverage is **planned**, not closed: three explicit gaps and one upstream API request remain. The packet adds **15 nodes** (5 constructions, 9 theorems, 1 definition), **46 API items**, **26 discriminating checks**, **6 planets**, and **18 pinned baseline declarations**. The reader contains the inherited stage targets as references, exact statements and hypotheses for the new inputs, dependency and proof outlines, all APIs and checks, and worked field computations. The predecessor packet is unchanged.

The new identifier prefix is `K2SymbolsBrauer:T.2:symbols/field-proof/`. Its targets supply the integral tensor realization; the homogeneous ideal/component comparison; field sign calculus; root-word normalization; the symbol-dependent torus, normalizer and Bruhat-fiber construction; rank-two action relations; faithful extension realization; zero-symbol splitting; stable separation and generation; tensor and relation divisibility; the real positive-entry subgroup; and finite-unit cyclic annihilation. The six planets are selected in the packet.

The field-specific negative-unit proof does not close the predecessor's general associative-ring localization gap. Likewise the pinned commutative-ring transvection identities do not establish the general associative-ring matrix calculus. The algebraically closed computation includes the relation-subgroup argument needed for **unique** divisibility in degrees at least two. The real computation identifies the divisible complement as the positive-entry subgroup. The finite Milnor calculation is independent of classical symbol generation. General transfer/restriction theory continues to be imported from its existing owner.

## Exact remaining work

1. **G-finite-classical.** Obtain and read a primary proof of the finite-field Steinberg presentation and stable kernel theorem. Matsumoto's statement on printed p.23 reports Steinberg's answer without proving it; Weibel III.6.1.1 uses symbol generation. Supply the opposite-root relations and stable-rank bridge, distinguishing exceptional small-rank central extensions from the stable kernel. The finite Milnor quotient's vanishing is already planned, but cannot replace this proof.
2. **G-Bass-Tate.** Read the arithmetic proof in Bass–Tate, *The Milnor ring of a global field*, LNM 342 (1973), pp.349–446, from an authorized source. Weibel III.7.2(a),(d), pp.61–62, supplies statements only. Decompose the signature isomorphism for number fields in degrees n≥3 and the vanishing theorem for positive-characteristic global fields in those degrees. The reader already explains the extension to transcendence-degree-one fields by putting each finite tuple of entries in a global subfield; no injective filtered-colimit map is assumed.
3. **G-stable-witness.** Supply the predecessor's exact group-colimit bridge: a finite word that vanishes stably vanishes after some finite stabilization. This is the inherited G-colimit dependency, not a theorem proved by this pass.

The request to **TauCetiRoadmap/ReductiveGroups, Layer 7: structure theory** asks for the existing ordinary SL_m Bruhat/root-presentation API: ordered upper-root coordinates, the unique monomial normalizer coordinate v(g), transformation formulas under upper unipotents, torus and simple normalizer elements, and the full ordinary root presentation. Uniqueness is of v(g), not of two unrestricted unipotent factors. This supplies the normalizer lift, Bruhat fiber, faithful realization and zero-symbol splitting. The request is recorded in the packet; no separate issue or message was sent. Ordinary root systems, Weyl groups, Bruhat decomposition and normalizers were not replanned.

At integration, retain the authoritative predecessor target ids and point their proof inputs to these new nodes using `suppliesProofInputFor`. In particular, generation and Matsumoto comparison must consume zero-symbol splitting and stable separation; they must not be prerequisites of those proofs. Algebraically closed, real and finite-field computations are outputs of the new inputs, not inputs to them. The stable-separation proof is conditional on the recorded colimit bridge and ordinary root presentation. No predecessor edit was made in this job.

## Sources and corrected convention

The following public primary/author sources were read in their stated versions. Locators, read dates and version hashes are preserved in the packet; neither source files nor extracted source passages are submitted.

- [Matsumoto, *Sur les sous-groupes arithmétiques des groupes semi-simples déployés*](https://www.numdam.org/article/ASENS_1969_4_2_1_1_0.pdf), published Ann. ENS (1969), pp.1–62: §§5–7, pp.23–47, especially Lemma 5.4(c), Theorem 5.10, Corollary 5.11, the torus formula pp.37–38, Lemmas 6.5–6.11 and the rank-two proof in §7. SHA-256 `4ac51e1290e2ab3c633d5a55378eb078f88d824bb3d28aac3585fce0595db5ca`.
- [Weibel, K-book, separate Chapter III author PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), author copy with creation metadata 2012-10-10: Exercises 5.8–5.9 p.46; §6.1 and its examples pp.48–49; Lemma 6.3 p.51; §6.4 and Proposition 6.4.1 p.52; §§7.1–7.2 pp.61–62; Exercise 7.3 p.72. SHA-256 `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307`.

The new finding `K2SymbolsBrauer/E-field-symbol-factor-order` is restricted to that Weibel author copy, Exercise III.5.9, p.46, inspected as extracted text and as a rendered page. For the conventions `[x,y]=xyx⁻¹y⁻¹` and `{r,s}=[h_ij(r),h_ik(s)]`, the correct torus defect is **h(rs)h(r)⁻¹h(s)⁻¹**, equivalently **h(r)h(s)h(rs)⁻¹**. Reversing the inverse factors gives the inverse symbol. Root conjugation and Matsumoto Lemma 5.4(c) independently fix the order. The t-adic tame value on `{t,2}` in Q(t) distinguishes 2 from 1/2, so an exclusively 2-torsion test would miss the error. The version of record was not obtained. The author-linked errata PDF returned HTTP 404; author-domain and general searches did not establish a correction. No novelty claim is made.

The accepted algebraically closed degree-bound correction is consumed without duplicating its existing source issue. The finite-rank centrality caution is retained: the same-root defect equality is used after stabilization or in the explicitly constructed central extension, not as an unsupported finite-rank centrality assertion. The normalizer's Weyl action uses the inverse conjugation formula of Matsumoto Lemma 6.5; the reader and tests preserve that sign and order.

Bass–Tate's original arithmetic proof and the required primary finite-field presentation proof remain missing sources. No uncleared book copy was used.

## Baseline, ownership and validation

Pinned statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The tensor-algebra grading, quotient/tensor universal properties, cyclic finite-unit theorem, transvection identities and factor-set extension are cited rather than replanned. The right-exactness declaration is **`rTensor_exact` in the root namespace**, not `LinearMap.rTensor_exact`.

The reviewed layer audit, predecessor and relevant stage links were read. Current upstream roadmaps and current Tau Ceti were checked, including the roadmaps absent from the atlas snapshot. GrothendieckEulerForms and RepresentationTheory/RootSystems were read for upstream shape and ownership. Current Coxeter Matsumoto modules concern reduced-word braid moves, not the K₂ field-presentation theorem. There are no ownership moves or edits to upstream roadmaps; `upstreamNotes` records the relevant current-library observation.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.2-symbols.json`: **0 errors, 0 warnings**.
- Source-version validation with `scripts.check_errata.versions_checked`: **passed**.
- Suggested Lean file: **elaborated successfully at the pinned shared build with only proof-placeholder warnings**, using `lean-check`. It has compact statements over pinned tensor/quotient/real-field carriers and real-bodied light definitions; no missing-body data definitions or substitute heavy carriers. Heavy API and check targets are in the reader, indexed in comments in the suggested file, as required by the 2026-10-12 roadmap-shape rule.
- Identifier/API/check consistency, unique new ids, minimum definition/construction checks, deliverable scope, and whitespace were checked before submission.

The next worker should independently review this completed plan, especially the torus factor order, inverse Weyl-action convention, negative-root Bruhat branch, rank-two coefficient cancellation and zero-symbol generation argument. Closing the stage then requires the three items and exact supplier API above. This handoff contains the durable resume information; it depends on no scratch artifact.
