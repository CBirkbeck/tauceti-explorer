# Handoff: PAPER-ANDRE-18-B

Issue #2188. Agent **Codex — codex-hjdg0j**, 23 September 2026. Continues #2210, #2222, #2233. **Partial**, with 108 items (17 library, 7 planned, 84 missing), five routes, 22 definition/construction APIs, 66 typed tests and 106 selected acyclic dependency edges.

## Delivered

The whole published paper was read and its hash recalculated. Hochster 1983 pp.504–518 and 538–543 now supply the actual unramified reduction via CE and root-ideal complexes. The theorem is no longer merely an unread citation, but the detailed suppliers remain G3.

The complete-base branch of A.3.1 is repaired. For regular local R and arbitrary M, use `Hom(H_m^d(M),E)≅Hom(M,Rhat)`, obtained from top local cohomology tensor comparison, currying and `End(E)=Rhat`. Over complete R this proves the needed ordinary-dual nonvanishing. Stronger: a pure algebra over any complete Noetherian local R splits directly, by extending `id_E` across `E→S⊗E` and currying. No endomorphism, integrality or regularity is needed for this complete-base theorem.

E5 disproves the printed reverse-direction formula with R=F_p and S=its algebraic closure: S is countable but its double algebraic dual is not. This is a false intermediate display, not a disproof of the main theorem. The same display occurs in Hochster 1983 p.541; the corrected direction suffices there because the base is complete. **Do not resume by attempting a Mittag–Leffler interchange of ordinary duals**; the complete case no longer needs that argument.

Mathlib already has `localCohomology`, `isoOfSameRadical`, tensor–Hom and injective extension, and `integralClosure`. Tau Ceti already has `IsInjectiveEnvelope` and uniqueness, but explicitly does not prove its existence. Those files were read at the pins. Missing Matlis comparisons refine R03.3’s existing PAPER-BHATT-ETAL-23/PAPER-HACON-WITASZEK-23 supplier, and generic Koszul complexes import DD.1. Do not duplicate them.

The original E4 zero-divisor counterexample, its corrected regular-r implication and the complete Artinian-coset retraction proof are preserved. E6 corrects two Tor terms in p.87 footnote 7, with the descending-induction proof now explicit. New findings E7–E12 record bibliographical/editorial/degenerate cases and already-published corrections.

All source findings are **unreviewed**. The former E1–E4 confirmation fields from #2233 were not issued by a finished review job, so PROTOCOL §18 does not count them. Their full mathematical reasoning is retained under `assessmentHistory`, not deleted or rejected. Do not restore a machine review verdict during a paper job.

## Resume order

1. **G4:** Read Hochster 2002 Lemma 5.1 and Bartijn–Strooker 1.7. Precisely define bounded partial module modifications with the distinguished element, denominator estimate, finite bad-chain criterion and balancing completion. Check the two-ring case 4.4.1. The printed product of arbitrary module-valued polynomials is not a valid definition.
2. **G3:** Hochster 1983 is now available with public URL/hash in `sourceReadings`. Split 2.10–2.17 into the root-ideal complex/API, distributivity, flatness, acyclicity, comparison homotopy and finite-stage equation. Check the original 1973 socle/monomial splitting criterion, coefficient-DVR/unramified-subring construction, residue enlargement and finite-domain reduction. Do not relabel the global reduction complete just because 6.1 was read.
3. **G1–G2:** Companion published 2.9.3,3.6.1,5.2–5.3; Scholze 6.4/6.7(i); Gabber–Ramero 2.2.26/3.1.3. Split approximation, finite-stage flatness and nonzero fibres, completed colimits and coherence. Apply completion over finite Noetherian stages, not over a falsely Noetherian union.
4. **G5:** Pure local completion for arbitrary finitely presented modules over the completed ring; coefficient extension, normalization/product flatness, compatible almost-CM square and CM descent. Keep regular target and separable residue extension.
5. **G6:** Only the noncomplete-base branch remains mathematically held. The corrected duality lands in Rhat, not R. The application with arbitrary noncomplete DVR V has not been settled. Neither its truth nor falsity is asserted. For complete bases use the new explicit proofs.
6. **G0/G7:** Finish introductory homological implications, Banach/Weierstrass and tower remarks, product purity, and fine Ext/Tor/Artin–Rees/Krull/coherence/normalization/parameter audits. The new Matlis interfaces need existence, Artinian endomorphism, Ext-to-Čech, base-ring and filtered-colimit adapters. Keep all underlying library carriers.

## Guardrails and validation

Preserve the five routes, especially the shared PerfectoidRamification Part II. Keep valuation/ramified almost ideals, module !/algebra !!, and product roots/g-roots distinct. Preserve m≥2 and p² witnesses. Ordinary purity precedes its P0 comparison; record stage dependencies without a spurious coarse cycle.

The report contains the full mathematical repairs and runnable checks. `check_paper.py`, intake file validation and `git diff --check` pass; 3,646 prior finite diagnostics and 15,066 square-zero identities were rerun. These are diagnostics, not proofs of infinite mathematics. No Lean was created or compiled. All provenance is public and local scratch paths are excluded from deliverables.
