# Handoff: PAPER-CLAUSEN-MATHEW-21

Claude Code, session `cc-442dc5`, 22 September 2026 (issue #1290).

## Done

The extraction is complete. `scripts/check_paper.py` reports ok, and every missing item is routed exactly once.

**What was read.** arXiv 1905.06611v3 ("various corrections and edits", 89 pages) was read in full from its TeX source and PDF. The published Inventiones PDF could not be retrieved (the request returned an HTML page), so the published version was not compared.

**Deliverables:**

- `research/blueprint/papers/PAPER-CLAUSEN-MATHEW-21.result.json`: 195 items (3 library, 12 planned, 180 missing), 6 routes, 20 prerequisites and 5 source issues.
- The report, `research/blueprint/papers/PAPER-CLAUSEN-MATHEW-21.md`.

## Judgement calls for the reviewer

**Two new Part IIs rather than one.**

- The hypercompleteness theory of §§2.2–4 is ∞-topos theory about sheaves of spectra. It extends EnhancedDerivedSheaves E2, so it goes to an EnhancedDerivedSheaves Part II.
- §§5–7 extend MotivicEtaleKTheory M.7, so they go to a MotivicEtaleKTheory Part II.

The K-theory Part II imports the sheaf-theory Part II.

**Chromatic homotopy theory is owned by the K-theory Part II.** The sheaf-theory Part II would otherwise need Morava K-theory only for two examples: Example 2.18, and the non-hypercomplete K(n) on 𝒯_{Z_p} of Example 4.15. So those examples moved with the chromatic inputs. If the reviewer wants Example 4.15 beside Theorem 4.26, the sheaf-theory Part II must import K(n) and Kuhn's theorem from the K-theory Part II at layer level.

**TC étale descent (Theorem 5.16) is in the K-theory Part II.** It is stated for E_2-spectral algebraic spaces, which live there. The Clausen–Mathew–Morrow extraction's item 111 (in RefinedTraceMethodsPartIIHenselianPairs) imports it, while the K-theory Part II imports that Part II's rigidity. The dependency therefore runs both ways at layer level, as between EnhancedDerivedSheaves E4 and DerivedDeRhamCohomology DD.1. Both briefs say so. An alternative is to split Theorem 5.16 into a discrete-ring case (in the henselian-pairs Part II) and the E_2 generalization. I did not do this because the proof is the same.

**Theorem 6.13 is split three ways:**

- prime-to-p with finite cd_p is marked planned in M.7, whose Quillen–Lichtenbaum statement is this case;
- the virtual case at 2 (η and the class of −1) goes to the K-theory Part II;
- characteristic p goes to the K-theory Part II, importing Geisser–Levine and Geisser–Hesselholt from the henselian-pairs Part II.

**Proposition 5.15 (Nisnevich descent for localizing invariants) goes to the K-theory Part II**, not to SchemeKTheoryOperations S.4. The CMM extraction marked the K-theory-of-schemes case planned in S.4. The statement here is for all weakly localizing invariants over E_2-spectral algebraic spaces.

**Noncommutative motives (Construction 5.25, Theorem 5.26) are missing, not planned in RT.5.** RT.5 plans localizing motives over the sphere. The paper needs additive, Perf(A)-linear motives over an E_2-ring, and the corepresentability of K_{≥0}.

**Corollary 4.39 needs genuine G-spectra**, which nothing plans. The brief says to include it only with an equivariant layer, since Corollary 4.40 has a second proof.

## Leads not recorded as source issues

- **Numbering drift.** Clausen–Mathew–Morrow (arXiv 1803.10897v2, proof of Theorem 6.5) cites "[CM18, Th. 3.17]" for the Nisnevich homotopy-dimension theorem. In arXiv v3 of this paper that is Theorem 3.18, so CMM used an earlier numbering. This is not a mistake in this paper, but consumers matching citations should expect it.
- **Remark 3.31** says that [RØ06, Thm. 4.1]'s reduction to the noetherian case needs uniformly bounded Krull dimension. This concerns an earlier paper and is recorded as item 194, not as a source issue here.
- **Small spellings.** "partiucular" (p. 55), "satsified" (Lemma 3.22), "Schereztoke" (Theorem 5.26 attribution) and "We do not know the whether" (Remark 2.26) are not recorded.
- **"t-bounded above objects are hypercomplete" (Lemma 2.6(2)).** The proof assumes right completeness of the t-structure on Sp(𝒞_{≥0}), which holds by construction. It is fine.

## Not done

Nothing remains in the extraction. The published Inventiones version was not compared.
