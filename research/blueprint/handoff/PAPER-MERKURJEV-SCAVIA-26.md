# PAPER-MERKURJEV-SCAVIA-26 handoff

Codex — codex-c83e7a. Refs #1408. Partial checkpoint after reading all 21 pages of arXiv v1 and comparing the author-hosted manuscript.

The result has 125 items (11 library, 10 planned, 104 missing), seven routes covering 102 missing and three planned items, and two deliberately unrouted items. The full report gives provenance, baseline statement evidence and proof corrections. No Lean implementation or compilation is claimed.

Resume here:

1. Obtain the final JAMS 39 (2026), 73–94 version via DOI 10.1090/jams/1059. The exact VOR filename is S0894-0347-2025-01059-9.pdf. Both publisher paths returned 403. Compare all statements with the October 2024 manuscript before deciding which printed corrections remain relevant.
2. Resolve `/64`: Lemma 4.1 is false without extra hypotheses. The real sign-action counterexample is explicit in the report. Item `/63` proves the version the main theorem needs, with nB=0 and μ_ne⊂F. Do not route the false unrestricted statement as a theorem to be implemented; determine the final text’s correction and record its exact accepted formulation.
3. Prove `/115`, Remark 5.8(2), with its roots hypotheses retained: res_U^N α is nonzero but negligible. Find an explicit expression in the φ_H generators for N, or an independent lifting argument. The author manuscript does not provide one. Do not confuse this with the zero central restriction at p=3.
4. Read the full Chu–Kang rationality proof, GMS03 I §5 and KMRT98 18.15/28.15. Their exact consuming statements are present, but primary-source closure is incomplete. Extend the prerequisite extraction if these proofs introduce additional constructions. GM22 pp.1–4 and targeted NSW statements/proofs were read; the full GM22 classification is not claimed read.
5. Expand the finite-group UCT proof to its generic Tor/resolution prerequisites, coordinating the common Tor monomorphism with existing consumers such as ClassFieldTheory. Reuse existing Tor carriers. The archived FoundationsAndLibraryIntegration atlas entry is not an active owner and was deliberately not used.
6. Refresh the reviewed audit, current stages, packets and proposed roadmaps before refining routes. Preserve upstream ownership of Kummer, five-term and Mackey theory, and R02.2 ownership of full Hochschild–Serre. The two proposed Part IIs have separate cohomological and explicit inverse-Galois targets.
7. Rerun check_paper.py and intake.py check-files. Complete status requires every source claim resolved or explicitly removed with justification, full prerequisite extraction, and each remaining missing item routed exactly once.

Useful regression evidence: all 3^9 matrices verify the p=3 norm and commutator-entry identities; individual cyclic order-three lifts exist; simultaneous commuting lifts do not. The top-left block map is multiplicative modulo p² even when the summand is not preserved. Keep the contragredient τ_31 weight and the minus sign in transgression.
