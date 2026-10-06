# Handoff — BP-HabiroRings--HR.2

Issue #6498. Agent: Codex, session `codex-7NZvwu`. Branch: `codex-7NZvwu-habiro-hr2`.

This is a completed planning pass, not a checkpoint. The packet is complete; the only stage in scope, `HabiroRings:HR.2`, is planned with remaining work. No stage is closed. All implementation statuses are unchecked.

The four deliverables are the HR.2 packet, reader, suggested Lean file and this handoff. No parent packet, atlas data, campaign document, reserved id or upstream source was changed. The nine accepted parent HR.2 nodes are imported by id. Five new nodes cover spherical localization, spectral completion, solid-unit idempotence, the completed countable free model and its solid tensor calculation.

Counts: 3 constructions and 2 theorems; 28 API entries in total (the packet checker reports 23, counting construction APIs only); 11 construction unit tests; 4 new planets; 3 pinned baseline declarations; 2 gaps; 10 supplier requests; 1 planned stage and 0 closed stages. Together with the parent’s Habiro-completion planet the current HR.2 layer has five planets.

## Established in the plan

Generic spectral module ownership is resolved to the existing H.5/E5 owners. `E5:abstract/module-objects` provides the module definition; H.5:spectra supplies its concrete spectral carrier and H.5:S-delooping its smash product. Relative tensor, coherent localization and HA 2.2.1.9 are exact requested extensions of E5:abstract. The E5:spectra-comparison return is used only after H.5, avoiding a foundation cycle. It supplies HA 7.1.2.13’s HZ-relative realization, not a second spectrum construction.

The new spectral completion API includes the reflection, factorial tower, completed tensor, homotopy/Ext exact sequence and degree detection. It reuses the accepted algebraic resolution, completeness and Nakayama nodes. The source’s corrected telescope differential is the already reviewed `HabiroRings/E8`; no new source issue was found.

The solid countable calculation specifies fibre/ideal objects, reverse pointwise profile order, countable product blocks and both cofinal ideal containments. The imported Gaussian polynomial proves P_aP_b divides P_(a+b); proper radial weights provide the other containment via max(f,g). The uniform lower bound needed for simplicial realization is a stated supplier obligation, not an unbounded conclusion.

Assembly must retain the scalar-base clarification: restriction along S[q±1]→HZ[q±1] commutes with completion but is only lax monoidal. The equivalence with D(Z[q±1]) is symmetric monoidal for HZ[q±1]-relative tensor. SH is spherical; H(H) is its algebraic counterpart. Do not equate these units or their tensor bases.

## What a follow-up must do

**G-solid:** Assign the proposed *Artin v-stacks, solid and lisse coefficient categories, Part II: light solid spectra*. VS2’s solid abelian/module theory does not own this spherical extension. The packet spells out the complete generic input: light hypersheaves of spectra, the discrete/point adjunction, internal-Hom null-sequence criterion, accessible solidification and monoidal coherence, countable product tensor, compact generator, split finite-free tower/relative-base-change compatibility, ω₁-filtered colimits, and the uniformly bounded-below resolution/realization and spectral null-family calculations. Read a primary written proof or establish those proofs from the cited lecture foundations. The sources read here do not prove that full spectral contract. Do not close HR.2 on the strength of Bosco’s algebraic p-adic theorem.

**G-signatures:** Once genuine H.5/E5 and light-solid carriers land, replace the suggested file’s mathematical name/statement ledger with typed spectral and solid definitions, API signatures and examples. There are no fake proposition fields or stand-in spectra in this submission. The ledger includes every unavailable construction/API/test and the named theorem forms; three arithmetic API items already have typed signatures.

Honor the ten exact requests to H.5:spectra, H.5:S-delooping, H.6, E3, E5:abstract, E5:spectra-comparison, DD.1, HC.1, QM.0 and VS2. These requests do not claim implementations exist. HC.1 retains ordinary factorial/completion ownership; QM.0 retains Gaussian-polynomial ownership; VS2 is used only for HZ-relative compatibility.

Preserve the accepted `HR.2:solid` split proposal and promote it atomically when its generic supplier is assigned. Move the parent B.7/B.8 nodes and the three solid support nodes to that substage; keep the algebraic and spherical completion in HR.2. The algebraic HR.3–HR.5 and HQ.3–HQ.5 path does not need the solid input. HQ.6’s analytic coefficients are the solid consumer. The proposed supplier and substage are not existing ids; no fabricated prerequisite id appears in the graph.

## Sources and baseline checks

Fresh primary readings: Wagner arXiv:2510.04782v2 Appendix B.1–B.8 (pp.77–80); Bosco arXiv:2306.06100v1 Appendix A.1/A.2–A.5 (pp.92–93); Wagner’s author thesis numbered paragraphs 5.1–5.3 (printed pp.85–86, PDF pp.89–90); Lurie, *Higher Algebra*, 18 September 2017, Proposition 2.2.1.9 and Theorem 7.1.2.13 with their context/proof. The packet records complete PDF hashes and exact locators. The thesis delegates solid foundations to Clausen–Scholze lecture recordings and unfinished notes; those recordings were not viewed in this run. This is source coverage missing for G-solid, not a newly discovered error in the paper.

Read the reviewed HR.2 audit AUDIT-17 and the relevant parent/import/consumer nodes. Read the upstream AlgebraicTopology and AdicSpaces roadmap documents for granularity and prototype conventions. Pinned `LaurentPolynomial`, `DerivedCategory` and `LightCondMod` statements were inspected. Tau Ceti searches used the pinned commit, not the shared build’s newer checkout. A focused Mathlib PR search for “solid spectra” returned no matching item.

## Verification

`python3 scripts/check_blueprint.py research/blueprint/packets/HabiroRings--HR.2.json` passes with zero errors and zero warnings against the shared pinned declaration index. `intake.py check-files` passes for the four authorized deliverables. JSON and the packet/reader/suggested name correspondence were checked.

`lean-check research/blueprint/suggested/HabiroRings--HR.2.lean` exited successfully with only the expected admitted-proof warnings, using Mathlib at the exact pinned commit. Memory was checked before compilation. The file imports only Mathlib modules, so the shared Tau Ceti checkout’s newer commit is not used in elaboration. This checks three typed polynomial/profile API signatures and seven algebraic/index acceptance examples. The spectral/solid ledger is comments and was not typechecked; its absence from the current type system is precisely G-signatures. No library build, update, cache download or language server was started.
