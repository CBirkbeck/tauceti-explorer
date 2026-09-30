# FIX-RT-PAPER-DASGUPTA-KAKDE-VENTULLO-18

Refs #4986. Codex — codex-5ebb6f, 30 September 2026. Input revision: `b4b15bfedee45fe8ac37314b08778eec9858068a`. Applies all four findings confirmed in [the independent verifier](RT-PAPER-DASGUPTA-KAKDE-VENTULLO-18.review.json). This is a routing fix; independent REV-FIX remains required.

## Finding 1: import the shared Hecke/Galois machinery

Route 1's IntegralIwasawaTheory Part II brief now explicitly imports IntegralHeckeAndGaloisDeterminants IHG.1, IHG.4 and IHG.6. The five affected item notes distinguish the imported general construction from the Gross–Stark specialization. The coefficient-ring residue field here is E of characteristic zero. Thus 1 and the nontrivial totally odd character chi are distinct even when p=2; the distinct-character GMA/extension-module construction is IHG.1's branch. The common packet has IHG.1 partial and IHG.4/.6 not_read. These are planned suppliers, without a claim of existing Lean proofs.

IHG.4 supplies the Frobenius-density/continuity pattern. Density alone does not prove integrality: the application must establish continuity and closedness of the actual coefficient subring and congruence ideal in the Lambda-adic topology. Published p.858, (54)–(55), and pp.860–861, (66)–(67), use finite generation for this purpose; v1 PDF pp.25 and 28 explicitly say so too. **Handoff to IHG.4:** if its common API lacks the finite-module closed-subring/congruence-ideal result needed here, add that request to the owning blueprint, with the topology and finite-generation hypotheses specified. The Gross–Stark Part II imports the result and verifies those hypotheses in its Hecke algebra; it does not plan another generic density-to-integrality theorem.

IHG.6 is a comparison with the separate residual-coincidence/local-condition branch used by IntegralIwasawaTheory I.7, not an unconditional replacement for DKV's distinct-character construction. The arithmetic choice of tau, Lemmas 4.2–4.3, Lemma 4.4, and the R/R-prime local calculations in Lemmas 4.6–4.9 stay explicit. The pinned Mathlib completed-ring Hensel input remains a library import, with its actual hypotheses to be checked at the application.

## Finding 2: give the Eisenstein family to L3

`rev-the-eisenstein-series-e-k` is now planned at AutomorphicPadicLFunctions:L3 and removed from the L0-only source route. A dedicated fifth source route supplies this item and the two existing L3 siblings `eisenstein-series` and `eisenstein-family` to L3's blueprint. Source routes may name planned items under PROTOCOL section 16. The original four route indices stay stable.

All three mathematical statements, including their two-character Fourier and constant coefficients, Hecke eigenvalues, weight specializations and mod-pi congruence, are unchanged. The owner notes import character data from L0 and ordinary/Hida-family packaging from PadicFamilies:L5. This agrees with accepted RS-14 and L3's Hilbert construction/congruence scope; the common packet still has L3 not_read. **Handoff to AutomorphicPadicLFunctions:L3:** use this source route for the swapped-character series and family contracts of published pp.848–849, (29)–(30). It is a source requirement, not an assertion that the construction is formalised.

## Finding 3: respect the narrowed I.3 owner

Removed IntegralIwasawaTheory:I.3 from the `deligne-ribet` and `teichmuller-character` planned lists. Rewrote the Part II reason and imports to follow accepted RS-16: the totally-real Deligne–Ribet existence/interpolation object comes from AutomorphicPadicLFunctions:L3; the cyclotomic/torsion projection and dyadic decomposition come from DirichletPadicLFunctions:L3. I.3 supplies only the pseudomeasure/Stickelberger normalization dictionary, and should be imported only for a separately identified comparison actually used. Neither of these two items requests that dictionary.

The p=2 clause is retained: the sign factor and `1+4 Z_2` decomposition are necessary. Tau Ceti's residue-field-unit Teichmuller lift is trivial over F_2 and does not supply the dyadic sign character. The trivial-character pole and the existing separate dyadic order-of-vanishing suppliers remain in scope. The brief now also states I.5's odd-prime scope clearly. As a consistency correction within the same brief, the old instruction treating Case 3 linear independence as an open extraction gap now follows the review's rejected E1: it remains a blueprint proof step, without reversing that source-issue verdict.

## Finding 4: record the actual source versions

Added four top-level sourceVersions receipts: the inherited 22 September published/v1 reads, explicitly attributed to Claude Code cc-d67081, and this fixer's selected 30 September reads. The historical published HTTP URL is retained in its receipt; the fresh receipt uses the working HTTPS URL. The inherited full-read/version-comparison account remains historical. This fixer checked selected routing-relevant passages and metadata, not both full proofs.

The [published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v188-n3-p03-s.pdf) has SHA-256 `974e64272b1883923fac951f86f3491593543d050c8efaf739e53342623fb659`. The [arXiv v1 PDF](https://arxiv.org/pdf/1605.08169v1) has SHA-256 `0bc900e2c7c16fa9aff1147ec138d121b4798fab3b4deb76eed415ba7f409a99`. Both freshly downloaded files match the original receipts and have 38 PDF pages. V1's last printed page is 38, also consistent with its arXiv version page. Corrected the inherited 33-page metadata to 38; this is not a new mathematical source issue. Selected fresh checks cover published pp.848–849,858,860–861,864–865 and corresponding v1 passages, including PDF pp.14,16–17,25–28,31–32 and the final page.

All 35 source-issue objects and their existing verdict payloads are unchanged. The read-only errata collector still returns 33 confirmed and two rejected records (E1 and E8). No new source issue or independent acceptance is invented. The old four-route paper review remains historical; the changed routing awaits REV-FIX.

## Validation and limits

The extraction retains 125 items: two library, 15 planned and 108 missing, across five routes. All 125 item identifiers, names, kinds, mathematical statements, locators, library lists and dependency fields are unchanged. 117 complete item records are unchanged. All 24 prerequisite records are unchanged. Each missing item is routed exactly once. The reader document records the same current counts and ownership changes.

The pinned checkouts were verified at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read the actual Mathlib `HenselianLocalRing` and `IsAdicComplete.henselianRing` statements in `Mathlib/RingTheory/Henselian.lean`, and Tau Ceti's residue-unit `teichmuller` statement in `TauCeti/NumberTheory/LocalField/Teichmuller.lean`. No additional item is marked library.

The existing extraction has no item dependency edges; its 125-node, zero-edge schema graph remains unchanged. This is not a proof-closure certificate. The assembled atlas baseline has 2,891 endpoints and 8,258 edges and is acyclic. An in-memory consumer vertex receiving the eight stated suppliers (IHG.1/.4/.6, Automorphic L0/L3, PadicFamilies L5, Iwasawa I.5 and Dirichlet L3) remains acyclic; reversing the IHG.1 direction creates a cycle and is rejected. This simulation reserves no real stage IDs and writes no atlas data.

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-DASGUPTA-KAKDE-VENTULLO-18.result.json`, explicit `check_errata.versions_checked`, the preservation/ownership/source-hash checks, `research/blueprint/intake.py check-files` on the three issue deliverables, and `git diff --check` pass. Only those deliverables are changed. The supplier handoffs above are instructions for their owners; no supplier packet, campaign, data or Tau Ceti roadmap is edited. No Lean file was changed or compiled, and no Lake build, cache or LSP was started.
