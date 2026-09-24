# RT-AUDIT-30 — independent red team

Agent: Codex. Session: codex-c83e7a. Read: 24 September 2026.
Target: accepted AUDIT-30, after REV-AUDIT-30. Status: complete.

Two medium findings correct an overlap and a hypothesis in explanatory notes. Neither changes a target's library label or a layer's coverage verdict.

## Coverage and method

| Roadmap | Audited layers | Targets |
| --- | ---: | ---: |
| MotivicEtaleKTheory | 14 | 63 |
| Polylogarithms | 6 | 28 |
| RefinedTraceMethods | 10 | 48 |
| SchemeKTheoryOperations | 7 | 38 |
| StableHomotopyKTheory | 8 | 45 |
| Total | 45 | 222 |

The full accepted audit, review, five roadmap documents and stage extracts were read. The census is 42 not-built and three partly-built layers; 197 absent, 20 partial, three Mathlib, one both-library and one Tau Ceti target records. This worker neither wrote nor reviewed AUDIT-30. This is an audit red team, not an area-wide source extraction or a claim that the proposed blueprints are closed.

All 189 citation occurrences resolve to 141 distinct declarations. Their statements were read at the pins with section assumptions, structure fields and needed definition bodies. The internal assignments in the cyclic Tate-cohomology statement and the S-unit construction were retained. All 122 cited source files match pinned Git blobs; supplemental checks bring the union to 133 files. The checked files contain no sorry/admit outside comments, and cited declarations are not axioms. This does not independently re-prove imported results.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The 217 absent/partial records were checked using the declaration index first, then both full pinned source trees. Twenty-one topic groups and three adaptive alternate-name groups cover all five roadmaps. Absence remains a bounded search conclusion. All 92 duplicate leads were compared with 70 distinct complete owner-stage descriptions, verified against the corresponding document sections.

## Finding RT-AUDIT-30/1 — the elliptic overlap has the wrong weight

**Medium; location:** `AUDIT-30.result.json`, Polylogarithms:P.5, duplicate entry `EllipticRegulators:ER.3`.

[P.5](https://github.com/CBirkbeck/tauceti-explorer/blob/331c5d75baf4bb6cd7b0d8d31a1305438445ffc4/content/campaign/Polylogarithms/README.md#L58-L62) explicitly separates its weight-two differential expression from its weight-three curve regulator and Eisenstein–Kronecker expression. Its target 4 belongs to the latter. The audit lists ER.3's elliptic dilogarithm Fourier/Kronecker–Eisenstein description as overlapping that target.

[ER.3](https://github.com/CBirkbeck/tauceti-explorer/blob/331c5d75baf4bb6cd7b0d8d31a1305438445ffc4/content/campaign/EllipticRegulators/README.md#L47-L53) constructs the q-orbit Bloch–Wigner dilogarithm and its logarithmic companion, with `R_q = J_q + i D_q`. The surrounding ER.2 fixes the regulator as K₂(E) → H²_D(E_R, R(2)). Its complete stage description supplies no weight-three curve-regulator construction. Sharing a family of analytic series does not establish equality of these weight-specific targets. P.5 itself explicitly warns against deriving weight-three elliptic claims from Bloch's weight-two argument.

Remove this ER.3 duplicate lead for the weight-three target. A carefully labelled analytic comparison could remain, but it cannot transfer ownership or discharge that construction. Preserve the valid ER.2 overlap for the weight-two η(f,g) expression. Keep the weight-three target absent and P.5 not built. This is a limited ownership correction, not a request to change ER.3's mathematical scope.

## Finding RT-AUDIT-30/2 — valuation divisibility is not always unramifiedness

**Medium; location:** `AUDIT-30.result.json`, MotivicEtaleKTheory:M.8, `targets[6].note`.

The audit correctly describes K(S,n) by valuations divisible by n outside S, then identifies this without qualification with the unramified-outside-S condition for μ_n. The [pinned definition](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean#L147-L167) allows arbitrary S and n. Neither its section assumptions nor Tau Ceti's [S-unit map](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/SInteger/SelmerGroup/Basic.lean#L126-L150) requires the residue characteristics outside S to be prime to n.

For R = ℤ, K = ℚ, S empty and n = 2, the class of −1 is in this valuation-defined subgroup: all finite valuations are zero. Its Kummer class at 2 cuts out ℚ₂(i)/ℚ₂. Set α = i−1; then α satisfies Y²+2Y+2, which is 2-Eisenstein. Thus the quadratic extension is totally ramified. Its nontrivial inertia element takes i to −i, so the cocycle g ↦ g(i)/i restricts nontrivially to inertia. The class is not unramified. The same cocycle convention is explicit in [Tau Ceti's Kummer construction](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Kummer.lean#L93-L107).

The local-field facts used here are in [Milne, Algebraic Number Theory](https://www.jmilne.org/math/CourseNotes/ANTc.pdf), version 3.08, 19 July 2020: Proposition 7.55, printed pp.129–130, characterizes total ramification through Eisenstein generators; Theorem 7.58, printed pp.130–131, identifies the inertia fixed field with the maximal unramified subextension. These passages were read on 2026-09-24; PDF SHA-256 `de2066ee7a319c0e6e521895a7e9e9567c2804bcafc0c8e67c417e508f2bc26b`.

State the valuation definition without qualification first. Add the unramified Kummer interpretation only away from residue characteristics dividing n; for number fields and positive n, require S to contain those finite primes. This does not supply the missing Galois comparison in Lean. Retain the partial label and the separate absence of crystalline/semistable conditions, Selmer complexes, determinant lines and regulator maps. The intended away-from-p application is compatible with this correction; the unrestricted gloss on the generic library definition is what fails.

## Remaining checks

### Motivic and étale methods

The finite-group Tate and norm-map developments, continuous low-degree cohomology, finite-quotient descriptions and corestriction are real inputs, not a full continuous derived-limit or arithmetic-duality package. Hodge `TateTwist` is a filtered Hodge construction; it does not supply Galois Tate coefficients. The ideal `artinHomAway` sends ideals away from a set to a finite abelian Galois group, but its source explicitly leaves kernel, image and ray-class factorization open. It does not supply the reciprocity/fundamental-class input required by the audit's duality targets.

Cycle groups are not rational equivalence, Chow rings or Bloch higher-cycle complexes. Function-field `normResidue` is a norm on residue-field units, not the norm-residue theorem from Milnor K-theory. Quaternion/Pfister inputs do not construct the full Milnor K-ring or its Galois symbol comparison. The étale and pro-étale site/cohomology foundations do not supply twisted motivic comparison, Beilinson–Lichtenbaum or Quillen–Lichtenbaum. Existing units, regulator lattices, exterior powers, cyclotomic characters and point-count Euler polynomials retain their recorded special-case/related scope. The Selmer-note correction does not change those conclusions.

### Polylogarithms and trace methods

Complex logarithms and arguments do not provide Li₂, Bloch–Wigner functions, their five-term quotient, higher polylogarithmic complexes or curve regulators. Log-trigonometric integrals mentioning special values do not define those functions. Five-term continuous-cohomology sequences and the archived Zagier proof about sums of two squares are unrelated search hits. Weight-three and weight-four comparisons cannot be inferred from weight-two analytic inputs.

Abstract simplicial objects, Dold–Kan and coproduct total complexes do not construct Hochschild/cyclic complexes with their multiplicative structures, THH, cyclotomic spectra, TC or trace comparisons. The total-complex construction was checked at its definition: it uses coproducts, not a general product totalization. Searches under Hochschild, Connes, cyclotomic, Tate, prismatic, delta-ring and alternate spellings yielded no missing endpoint. Existing Witt vectors, divided powers, completions, naive cotangent input and Fontaine rings remain foundations rather than a derived de Rham/prismatic or refined-trace theory.

### Scheme K-theory and operations

The abelian category of sheaves of modules, complexes, quasi-isomorphisms and ordinary derived-category infrastructure are credited. The audited S.1 complex/quasi-isomorphism target and S.7 divisor target withstand the check; their neighboring perfect-complex, K-theory and comparison targets remain distinct.

The Cartan equivalence requires supplied finite projective resolutions; it does not itself prove their existence over every regular ring. The projective-dimension theorem for quotienting by a regular element is not the full Auslander–Buchsbaum–Serre criterion. A Rees algebra is not a constructed scheme blow-up, and a plumbing-graph blow-up is different geometry. Degree support of a homological complex is not support on a closed subscheme. No source inspection supplied the missing localization/descent, projective-bundle, lambda/Adams, flag or Gysin packages. Accepted RS-18's scheme ownership and RS-08's motivic ownership remain relevant imports, not additional targets of this red team.

### Homotopy foundations

The category nerve, geometric realization and Tau Ceti local-coefficient carrier genuinely provide the three present H.1 targets. Other credited ordinary topological and simplicial foundations do not yet produce the listed classifying-space/group-completion, spectra and K-theory endpoints.

Extra degeneracy gives a simplicial homotopy and chain contraction, but the inspected formal-coproduct construction is a split Čech augmentation; it is not the whole terminal-category-nerve/realization argument or natural-transformation-to-realized-homotopy theorem. The scoped model-category instance is for bounded-below complexes with enough injectives, not the Kan model structure on simplicial sets. Categorical van Kampen colimits are not the fundamental-group van Kampen theorem. Uniform-space completion of a topological group is not homotopy group completion. Clifford-algebra Bott periodicity is not a spectrum-level Bott theorem. Abstract spectral objects and pages do not supply convergence or the homotopy spectral sequences merely by being present.

## Freshness and validation

Acquired inputs at `331c5d75baf4bb6cd7b0d8d31a1305438445ffc4` were refreshed to `f5284ee51da124df1ab9e01291dc4998eecc100e`; no guarded input changed. Publication rechecks input hashes and the original state of both deliverables.

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-30.result.json` — passed.
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-AUDIT-30.result.json research/blueprint/redteam/RT-AUDIT-30.md` — two files, zero problems.
- Census, citation-location, pinned-file and authorized-path checks — passed.

Only the two authorized deliverables are submitted. No Lean file was compiled and no new mathematics is claimed formalized. Both findings go to independent verification.
