# HE.0–HE.7 revision round 2

Completed 2026-10-06 by Codex, session `codex-X0Qf6a`, for issue #6502
(`BP-HeegnerPointEulerSystems--HE.0~2`). This is a completed target-level
planning pass. All eight stages are **planned**; none is closed or implemented.
The independent review object is preserved unchanged for the next reviewer.

The packet now has 78 declarations: 71 theorems, one comparison, four
constructions and two definitions. All 70 preceding IDs remain. The six
objects retain 24 API items and 18 unit tests. There are 43 planets, 13 pinned
baseline citations, 21 precise gaps and 64 supplier requests. Every
`implementationStatus` remains `unchecked`. RS-04's accepted ownership is
retained; no supplier, atlas, application or stage-link file was edited.

## What this round changed

The reader now agrees with the reviewed packet: corrected R18 suppliers,
Howard's H2 field K(E[p∞]), Gross's weaker clean mod-p hypotheses, Zhang's
indefinite/definite parity, ν+1 sign convention and good-prime base locus.
The five source findings remain intact, including the corrected
ideal/absolute-norm formulation of Khayutin Lemma5.8.

Four new HE.6 targets specify Zhang's actual V/k₀ local pairing, relation(8.1)
and parity, two-class prime detector, and prescribed-ramification class.
The triangular proof uses these arithmetic interfaces, its 2ν+1 primes and
ν+1 classes; Lemma8.2 alone is not claimed to give singular nonvanishing.
The period ratio is η_g(N)/ξ_g. Its independent early export
`BSD.3a/definite-congruence-period` is proposed with exact odd-definite,
full-♥ and nonsquarefree hypotheses. BSD.5/BSD.6 supply no prerequisite edge.

Nekovář's integral CM-point proof replaces unsupported exceptional, dyadic,
CM and RM estimates. The fixed setup states the totally real field,
quaternion ramification, central-quotient curve, simple Hecke quotient with
maximal RM order, CM embedding, integral Hodge denominator and trace point.
The specialization is α=1 with no CM acquired over K. Explicit cocycles avoid
assuming torsion-invariant vanishing. The constants are uniform in conductor
and sufficiently large principal powers of each coefficient prime; integral
1±ρ handles 2. The two-prime proof gives the stated 2²¹ annihilator and full
Sha finiteness, including geometric CM after verifying its field condition.
Four new HE.7 targets record image defects, actual prime detection, the
CM/Heegner-field comparison and the separate classical square-index theorem.

The dihedral prototype now transports pinned cyclic-dihedral algebra; the
indivisibility prototype transports a nonzero auxiliary localization. The
review's two algebraic counterexamples no longer apply to these shapes.
Unavailable arithmetic hypotheses and carrier identifications remain explicit
prototype omissions under protocol §13.

## Sources and requests

New primary reading: Nekovář's 53-page author preprint, setup and §§3–7;
Pollack–Weston §§6.2–6.8; Kolyvagin's 1991 published introduction and Theorem A.
The archived Nekovář author text, pagination and hash are in the packet's
source receipt. Zhang's Notations/♥ and §§6–8 were rechecked. Existing source
and independent-review receipts are preserved, with no claim of whole-paper
reading beyond the recorded sections.

The original Kolyvagin *Euler Systems* cardinality proof was not obtained:
the public Springer endpoint supplied a purchase page. The 1991 theorem
confirms the exact quoted size statement and full O-linear Tate-image good
set over End(E)⊗Q; it is not a substitute for that proof. The source-acquisition
and ES.4 cardinality-export boundary is explicit and separate from the read
integral finiteness proof.

Confirmed red-team findings are handled as follows:

- RT-AREA-iwasawa-1/2: import existing R20.2 level raising and request the
  stronger exact-Nq/local-type Diamond–Taylor variant.
- /8: use R17.3, ModularIwasawa L1, Kato L4 and exact GL₂-type contracts;
  retain the removal proposal for the incorrect R17.5 edge.
- /9: request the general Serre/Ribet, homothety and endomorphism/residual
  irreducibility exports through proposed R28.7. HE keeps the application.
- /10: generic Howard DVR and Λ theory belongs to ES.5 and ES.8; propose
  their GH.5 links and HE.6→HE.8. No Λ target is added to this part.

## Validation and next independent review

`check_blueprint.py`: zero errors and warnings. `check_errata.py`: all five
preserved findings and version receipts pass an errata-v1 projection.
`lean-check` completed with exit0, zero errors and 114 admission-only warnings
at exact Mathlib commit 082e2d3 (Lean4.34.0-rc2). Every node/API name and all
18 example labels are present. The file imports Mathlib only; Tau Ceti sources
were inspected at f790474, with no Tau Ceti olean compilation claim.

The next reviewer should check the new source-specific hypotheses, constants,
CM field argument and Zhang detector/reciprocity chain, then replace the
preserved review verdict. Follow-up implementation needs the named supplier
exports: independent early BSD period comparison, exact local-type level
raising, ordinary GL₂-type rank-zero control, ES local/self-dual/integral
engines, CM conductor dictionary, R28 image contracts and finite abelian
Selmer theory. Production carriers/global χ localization, the original
square-index proof, nonmaximal-order extensions and the exact analytic RM
height certificate remain the precise gaps recorded in the packet.
No scratch file is needed to resume; source URLs, hashes and reading boundaries
are retained in the deliverables.
