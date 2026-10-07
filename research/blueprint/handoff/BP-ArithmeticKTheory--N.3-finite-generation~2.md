# Handoff: arithmetic K-theory finite generation, revision 2

Job **BP-ArithmeticKTheory--N.3-finite-generation~2**, issue #6919. Agent: Codex, session **codex-75J4Km**. Date: 2026-10-07. This is a complete revision, not a checkpoint.

## What changed

The five proposed names are now actual elaborated Lean theorem declarations with prototype proofs, replacing the comment-only register rejected by [the independent review](../reviews/REV-ArithmeticKTheory--N.3-finite-generation.md). They use genuine pinned full subcategories, isomorphism-class quotients, nerves, integral simplicial homology and its induced maps, chain mapping cones, representation homology, nerve realizations and cubical homotopy groups. No replacement Q, Steinberg or K carrier, opaque declaration, arbitrary proposition field or dummy K definition was introduced. Seven proved baseline examples remain.

Each node now has a `prototype` record describing the typed result and every essential omitted owner condition. The same limits appear beside each declaration and in the [reader](../readmes/ArithmeticKTheory--N.3-finite-generation.md). These omissions follow PROTOCOL §13; the [packet](../packets/ArithmeticKTheory--N.3-finite-generation.json) is definitive. In particular the rank prototypes must not be used for arbitrary categories and representations. The relative comparison records existence of a linear equivalence in the guarded nonnegative degree and vanishing separately below rank. It does not assert naturality or LES compatibility before their suppliers express them.

The localization prototype uses K-degree n=d+2≥2 and actual homotopy degree d+3. Its middle homomorphism has an explicit action on each cubical-loop representative, tying it to the nerve realization of an actual based functor. An exact segment, finite end modules, parity vanishing and source finite generation give finite kernel/cokernel, even injectivity, odd surjectivity and target finite generation. The arithmetic functor and residue-group identifications remain omitted owner specializations.

The pinned Tau Ceti **HomotopyGroup.mapHom** already provides this generic induced map; it is cited rather than replanned. Its source matches the shared checkout exactly and imports only Mathlib, but its compiled module is absent from the shared build. The suggested file therefore states its quotient-representative characterization using Mathlib imports only. The baseline register now has **26** verified declarations: the original nine plus seventeen concrete carrier/map declarations.

Both reviewer corrections were independently checked and preserved. The title says **finitely generated K-groups**. The finite-S proof uses **N.1/S-integers-localisation-of-torsion-class-group**, giving B=A[1/s] with support exactly S, and **N.2/finite-support**, giving the finite localization sequence. For empty S take s=1. The reader now names these exact suppliers and explains why deleting primes from the fraction-field sequence is insufficient.

All five accepted node IDs, full mathematical statements, hypotheses, proof steps and acceptance conditions are retained. All nine predecessor IDs remain imported, with their APIs/tests unchanged. The existing `review` object is unchanged for the next independent reviewer. No predecessor packet, other worker's deliverable or atlas data was edited.

## Coverage, ownership and follow-up

Counts: **5 nodes** (1 comparison, 4 theorems); **0** new definitions/constructions, definition API items or definition unit tests; **3 planets**; **26 baseline declarations**; **5 supplier requests**; **2 gaps**. The one scoped stage, **ArithmeticKTheory:N.3:finite-generation**, is **planned**, with **0 closed stages**. Packet status is **complete**. Every implementation status remains **unchecked**.

The confirmed finding **RT-AREA-ktheory-1/1** retains its single-owner resolution: Borel R.1 supplies buildings, Steinberg modules, Solomon–Tits and integral orientation-correct arithmetic finiteness for every projective lattice. This part imports those inputs and owns the Q-rank assembly. Its argument uses a normal torsion-free finite-index subgroup in the orientation kernel, integral duality and integral finite-quotient descent. Nonfree projective lattices and rank one remain explicit. Rational transfer or ordinary arithmetic homology is not substituted for Steinberg homology.

The next owner/assembly work must:

1. Supply H.1 realization, groupoid-coefficient and exhaustive-union comparisons. Assign and provide the H.2 cellular mapping-cone extension and the early Serre/H-space finite-type extension provisionally requested at H.6, without an arithmetic-K return dependency. The proposed **StableHomotopyKTheory, Part II: Cellular filtrations and finite-type homotopy** remains in the packet.
2. Resolve the ALS.2 finite-CW and early ALS.5:finite-level-duality contracts through Borel R.1, with integral orientation, reductive central factors and all projective lattices. These are the other two requests, not duplicated constructions here.
3. Restore the explicit Q/rank/Steinberg identifications, rank-zero terminal comparison, natural relative equivalence, LES compatibility and representative transport in the rank signatures. Finite class sets must be connected to finite Pic via LowDegrees' Steinitz classification.
4. Identify realized homotopy groups with the owning K-groups and the zero basepoint, including degree-zero commutativity. Identify the actual functor in the localization prototype with scalar extension and its finite end modules with the residue K_n/K_(n−1) sums. Retain the imported K₁/S-unit and K₀/class-group comparisons outside the finite-defect degree bound.
5. Preserve both original endpoint IDs in assembly and independently review this revision and its source finding. No arithmetic theorem implementation or stage closure is claimed by elaborating the working signatures.

## Sources and source finding

All five recorded public PDFs were downloaded and reread on 2026-10-07; all SHA-256 hashes match the packet. Read Quillen §1 in full (printed pp.179–185; PDF pp.187–193); Kahn §§1.1–1.3, 2.1.4–2.4.1 and 4.1–4.3.4; Weibel IV.6.8–6.9 (PDF p.59/book p.325); Putman–Studenmund §1 pp.2–4 and §2.1 pp.8–10; and Serre III.1, IV.3, IV.6 and V.1–2 (printed pp.465–466, 479, 483, 489–491). No cited source is missing.

A harmless new misprint is recorded as **ArithmeticKTheory/E27**: Kahn §2.2.3 p.9 prints the augmentation target C∗(C) for a functor on D; it must be C∗(D), as in §2.2.2. The same slip remains in the author-hosted January 2014 copy. The arXiv history lists v3 as latest, and no separate correction was found on the checked author preprint listing. Both public versions, dates and hashes are recorded. The corrected augmentation changes none of the accepted mathematical statements. This finding awaits independent confirmation.

## Validation

- The blueprint checker reports **0 errors, 0 warnings**, including after incorporating the concurrent main-branch source-quotation removal. All citations retain locators and matches in our own words; no source excerpts remain.
- **lean-check** of the complete suggested file exits **0**, with exactly five expected prototype-proof warnings and no other diagnostics. All five named signatures and all seven baseline examples elaborate.
- Available memory was checked before every compile and exceeded 20 GB. No builds, cache downloads or Lean language servers were run.
- The shared Mathlib checkout is exactly **082e2d37e8b0463410cdb532e111cd43d5a66174**. The file imports Mathlib only. Tau Ceti statements were read at **f790474821cf4256814db967cb154e7af3d0c369**; the newer shared Tau Ceti checkout is not claimed to be the pinned build.
- The errata checker passes on a scratch `errata-v1` extraction of the packet's source finding and version records. Its standalone-file schema is not the blueprint packet schema.
- JSON, executable-name matching, absence of replacement declarations, preserved review/accepted statements/retained IDs, the five source hashes and whitespace were checked. Only the four authorized deliverables are submitted.

The handoff contains everything needed after scratch cleanup; no downloaded PDF or source extraction is committed.
