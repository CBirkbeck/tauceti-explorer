# FIX-RT-PAPER-GAN-SAVIN-23-B

Codex, session `codex-J6LwjP`, 2 October 2026. Refs #5698.

Applied all three findings confirmed in
[the independent verification](RT-PAPER-GAN-SAVIN-23-B.review.json) to the
paper extraction and reader document. The six routes, 128 item IDs,
1 library / 4 planned / 123 missing statuses and existing source issues
E1–E15 are preserved. The future roadmap jobs receive the corrected
targets through their route briefs; this job does not edit an unwritten
blueprint or claim Lean implementation.

## Finding 1: fixed split enhancements

Item 1 and clause (b) of `ExceptionalThetaCorrespondencesForG2` now
distinguish the raw group S_φ = π_0(Z_{G^∨}(φ)) from the fixed-split packet
enhancement group π_0(Z_{G^∨}(φ)/Z(G^∨)). Split enhancements are trivial
on the image of the dual centre. Another inner form requires its prescribed
Kottwitz central character. This preserves all Irr(S_φ) for G_2, whose
dual centre is trivial, the explicit Z(Spin_7) quotient for split PGSp_6,
and the raw centralizer maps in Lemma 2.4, items 25–27.

Check: for the PGL_3 Steinberg parameter Sym²(SL_2), Schur's lemma gives
raw centralizer μ_3 in SL_3. Quotienting the dual centre leaves one split
enhancement; the other two characters select the cubic nonsplit inner
forms. The published introduction p. 2 asks for refined fibres without
making the extraction's universal raw-group assertion; p. 4 specializes
the formula to G_2 and §7(c), p. 22, uses the Spin_7 centre quotient.
Therefore no new source erratum is assigned to this finding.

## Finding 2: the nondiscrete club lift

Item 9's PGSp_6 codomain is now generic tempered. Item 62's separate
discrete-lift hypothesis is explicit; item 64 states the spin identity
on Irr^♦_{gen,ds}(G_2). The full spin identity remains item 9's target.
The LLC route and reader document require an independent club-locus
argument: start with the explicit PGL_3/Siegel lifts of GS23 Theorem 15.2,
then compute the GL_8 spin parameter via the classical theta correspondence
and triality. Proposition 5.2 cannot be used for that nondiscrete lift.
These remain missing constructions, with their existing ownership intact.

Check: companion arXiv:2102.00372v1, Proposition 3.1(ii) p. 9 and
Theorem 8.5/proof pp. 27–28 identify the generic discrete series
π_gen[1] = θ_B(St_{PGL_3}^+). Its PGSp_6 lift is
I_3(St_{PGL_3})_gen by §10.3 pp. 32–33 and Theorem 15.2(iii)
pp. 52–53. It is tempered induction from a proper GL_3 Levi, not discrete
series. Published Proposition 2.3 p. 8 independently rules out two
discrete-series lifts. Proposition 5.2 pp. 20–21 assumes its PGSp_6 lift
is discrete; Corollary 5.3 does not supply the missing club-case argument.
Added source issue E16 against the published diagram on p. 4. The identity
itself has not been disproved.

## Finding 3: Fell closure

Item 117 and the `SmoothRepresentationsPartIIUnitaryDual` endpoint now
say [σ] ∈ closure_Fell{[π_i]} when σ is weakly contained in ⊕̂_i π_i.
No convergence of an ordinary subsequence, or additional countability
premise, is asserted. Item 118's statement is unchanged and its note now
explains why isolation gives σ ≅ π_i. The globalizations importing that
corollary consequently need no new failure or hypothesis.

Check: in G_2(Q_5), put π_1 = St and π_n = 1 for n ≥ 2. Weak containment
holds by the first Hilbert direct summand. Every increasing-index
subsequence is eventually trivial; it cannot converge to St, isolated by
published Proposition 11.3 pp. 32–33. The proof of Proposition 11.6 on
p. 33 never forces increasing original indices. BHV Exercise F.6.4,
printed p. 444, gives precisely the set-closure formulation. Added E17
against the published subsequence claim, while preserving Corollary 11.7.

## Sources and checks

Fresh targeted reads on 2 October 2026:

- [Published Gan–Savin paper](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/local_langlands_conjecture_for_g2.pdf),
  pp. 2, 4, 8, 20–22, 32–33; rendered pp. 4 and 33 checked.
  SHA-256 `bfba18a98cf7bbfaef63b3d961afd19a60fe09220fbdd5772a3901ded777f490`.
  Cambridge's per-download stamp makes this a download fingerprint; the
  extraction preserves the earlier reproducible text-hash note.
- [Companion arXiv:2102.00372v1](https://arxiv.org/pdf/2102.00372v1),
  pp. 9, 27–28, 32–33, 52–53, supplying the counterexample only.
  SHA-256 `8b3b6702909a6a936e5984f46a3c2fbfe629b63db4ba0ae9bd4356286508c6e5`.
- [BHV author version](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf),
  Exercise F.6.4, printed p. 444 / PDF p. 450.
  SHA-256 `0281823290dfb42efc0542705b4f232f9e3d9186e945914ffb65b59db790c889`.

The extraction and source-issue records contain the read scope and bounded
correction searches. The arXiv sequel record lists only the two 2022
versions. Erratum/corrigendum and Proposition 11.6 searches found no
correction. Attempts to open the publisher landing page and authors'
pages failed; no absence of corrections there is claimed. Crossref's
article record has no update or relation entry. E16–E17 await the independent
fix review; the historical extraction review of E1–E15 is not extended by
this submission.

Validation: paper checker, source-issue and version validators, intake
check of the three deliverables, exact preservation of existing IDs and
statuses, every missing item routed once, and whitespace checks. These
are structural checks; the source comparisons and counterexamples above
provide the mathematical evidence. No Lean file is required, changed or
claimed compiled.
