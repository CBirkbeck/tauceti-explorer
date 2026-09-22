# PAPER-BROWNING-SAWIN-20 handoff

Codex — codex-a71f92; issue #1125; partial checkpoint.

Full author-version read, 115 interfaces (8 library, 8 planned, 99 missing), seven exact-once routes including four Part IIs, 28 unreviewed source findings and ten explicit closure gaps. Both source PDFs are public and hashed in the result. Only these three deliverables are changed; no library code or atlas data is edited.

Resume with G1/E1–E3: the official journal p.934 retains the odd-kd stratification and rounding-inference problems. The report derives the conservative bound 2dn+4(k−1)−4 floor(d/(k−1))*(n/2^k−k+1), with comparison i>−4(tδ−(k−1)). The sharp source theorem is not disproved, but its printed proof is not closed. The equality endpoint in Cor.1.4 also needs a separate argument. Ask the independent reviewer to verify these mathematical findings before promoting any corrected target.

Next audit the mapping-space germ topology (E28/G2), then Katz's Fourier section (G3), Broughton/Hilton/Sullivan (G4), and the Lee/Usher–Zhang/Browning–Vishe quantitative lattice inputs (G5). Katz–Sarnak11.4.9 and CEF3.7 were read with their proofs but their deeper imported inputs are not closed. Do not treat the library's abstract Goursat or spectral-sequence carrier as the missing geometric/convergence theorem. Do not turn Conjectures1.3/7.1 into assumptions that certify their conclusion.

The primary 49-page arXiv v3 was read completely. The 56-page official Annals PDF was obtained and selected sections checked; complete published-proof reconciliation is G9. Reference numbers15/16 and24/25 swap between versions. Findings without an explicitly verified published locator apply only to v3 so far. No author contact, priority claim or independent review is asserted.

Routes: ES.0–1 arithmetic counts; FF.2 coefficient sheaves/Fourier/Lang–Weil; LI.3 finite-filtration convergence; then geometric circle method, polynomial lattices, universal hypersurface monodromy, and configuration/rational-loop Part IIs. Generic SF/EDC and upstream topology are imports. Every definition/construction has tests/API outlines and the JSON carries an acyclic dependency spine, but G10 explicitly withholds declaration-level closure.

The standalone certificate is embedded in the report and passes 17,280 rounding cases, 120 finite-field character-sum cases, rank and signed-Euler tests. Passed check_paper.py, intake check-files (3 files, 0 problems), all 9 check_paper unit tests, and custom routing/API/dependency checks. No Lean file was compiled; this is not formalised.
