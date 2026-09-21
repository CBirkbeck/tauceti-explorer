# PAPER-NEWTON-THORNE-26 — partial extraction handoff

Agent: ChatGPT Pro. Session: `cp-2109-planets01-f7c2`. Date: 2026-09-21.
Issue: #1053. Snapshot: `5354d3adfa696e54a69f68abc658970cab16b82b`.

## Saved work

The paper-v1 packet contains 57 records: 34 theorems, 14 constructions and nine
definitions. One underlying representation carrier is cited from pinned Mathlib;
eight records import already-planned stages; 48 exact source-specific records
have one source route each, to seven existing proposed roadmap owners. No new
roadmap is proposed. All retained item IDs are stable continuation identifiers.

The main symmetric-power endpoint is already in ModularityAndLanglandsExtensions
ML.3. Its exact tensor-lifting theorem goes to ML.5. The extraction preserves all
nine hypotheses of Theorem 4.1, the residual rather than characteristic-zero
conclusions of Theorems 5.5 and 5.9, the different-weight companion, the congruence
at the auxiliary coefficient prime t in Lemma 5.7, both dihedral auxiliary places,
and the ordered splitting conditions. The final CM and non-paritious scopes are
not promoted to unrestricted GL2 functoriality.

Class fields and Hilbert reciprocity are imported from the existing upstream
ClassFieldTheory stages. General-rank ordinary and compatible-system inputs are
not assigned to the rank-two ordinary lifting roadmap. The paper and atlas use
opposite Hodge–Tate sign conventions; the packet records a required comparison.

## Exact next work

1. Start with Section 3, Lemmas 3.3–3.12 and Propositions 3.13–3.14. Add individual
   local/global deformation rings, auxiliary extensions, character coefficient
   algebras, common reduced special fibres, Hecke modules and generic-prime
   connectedness results. Keep the scalar-at-T modification and dimension-one
   characteristic-p prime hypotheses in Proposition 3.13. Theorem 3.2's tensor
   does not meet the usual Steinberg lifting hypothesis.
2. Decompose Section 4, Lemmas/Propositions 4.2–4.9, before marking Theorem 4.1's
   proof closed. Include torsion semistable pseudodeformation conditions,
   quaternionic/unitary modules, tensor maps, Taylor–Wiles data, support and the
   adjoint-Selmer regularity theorem. Proposition 4.9 is the p=2 patching
   construction, including the formal-torus two-torsion action. Read the diagrams.
3. Complete Section 1.2 conventions and Definition 2.5(1), then split the
   internal choices and preservation lemmas in Sections 5–6. Add the exact
   inertia-generation theorem over Q and all imported local weight/irreducibility
   bounds. Joint existence records refer to the same witness throughout.
4. Audit the 19 prioritized prior-paper records against their actual sources
   and existing atlas packets. They are unresolved coverage checks, not claims
   that those papers are absent. Also complete the Dot18/Sho18, Kisin/Snowden,
   Patrikis, Maire, Goursat/Dickson and Fontaine–Laffaille inputs listed in the
   packet's remaining work.
5. Complete the exhaustive pinned-library and blueprint-packet search. The
   current-branch negative keyword searches are only leads. The reviewed audit
   marks ArithmeticGaloisRepresentations:G7 not built, but no direct ML.3 audit
   was found; neither fact substitutes for declaration-level checking.
6. Obtain the public version's PDF bytes and SHA-256; finish visual diagram
   inspection and compare the author version with the published version. Re-run
   the repository validator against the current full atlas.

## Provenance and checks

Read version: arXiv 2212.03595v2, 19 February 2025, through its versioned HTML and
parsed 52-page PDF. Published metadata: Annals 203 (2026), no. 1, 283–347,
DOI 10.4007/annals.2026.203.1.4. A byte hash and a line-by-line comparison with the
published version were not obtained. Several PDF page screenshots failed;
complete diagram verification is not claimed.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The Mathlib Representation declaration
was read at the pin; the inspected Tau Ceti modular-form basics are a near miss,
not a supplier for higher-rank automorphy.

Local JSON, unique IDs, counts, item/context references and once-only routing
checks passed. Full `scripts/check_paper.py` validation is requested through the
hosted submission check; no local full-atlas execution is claimed. No Lean file
was changed or compiled. The packet deliberately remains `partial`.

Submit this checkpoint rather than claiming the paper is fully extracted.
Opening its PR ends this session's claim; continuation must re-read the live
issue, claim it under WORKERS, preserve correct saved records and resume above.
