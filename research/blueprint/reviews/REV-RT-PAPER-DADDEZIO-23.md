# REV-RT-PAPER-DADDEZIO-23

Independent verification of the red team RT-PAPER-DADDEZIO-23 (Codex, session `codex-rtOQ9t`, PR #5364) for issue
#5055.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction PAPER-DADDEZIO-23 (`cc-fb70e5`, PR #4272);
- its review REV-PAPER-DADDEZIO-23 (`cc-58621d`, PR #4709);
- the red team.

**Result: all four findings confirmed.** /3 is high, the rest medium. For /2 and /3, the fix should also record new
source issues; the reasons say which.

## What I read

**The paper.** Marco D'Addezio, *Parabolicity conjecture of F-isocrystals*, arXiv 2012.12879v4
(<https://arxiv.org/pdf/2012.12879v4>), SHA-256 `f92379be…a07a8`, equal to the red team's. I read pp. 6–7 (§2.2 and
§3.1), p. 10 (Lemma 3.3.1, Proposition 3.3.2) and p. 19 (Corollary 4.3.6) in full.

**Abe.** Tomoyuki Abe, *The Langlands correspondence for isocrystals*, arXiv 1310.0528v3
(<https://arxiv.org/pdf/1310.0528v3>), §4.2.1–4.2.2 (pp. 103–104).

**The atlas side:**
- PAPER-DADDEZIO-23: items 1, 19, 33, 35, 42, 50 and 68, its six routes and E1–E14;
- PAPER-ABE-18: items 25 and 32, and routes 1 and 2 with their accepted verdicts;
- the RD.3 stage text in `data/atlas.json`.

## /1 (medium, missing): Abe's finite-order hypothesis. Confirmed.

Abe's Theorem 4.2.2 concerns A_r, the cuspidal representations "with central character of finite order". The accepted
PAPER-ABE-18/32 and route 2 brief say the same.

D'Addezio's route 4 says it consumes the theorem "exactly as that brief states it: every Q̄_p-linear cuspidal
automorphic representation ... corresponds" and "adds no target". Item 19 also says "every". Theorem 5.3.3 (item 68)
needs every cuspidal π.

The twisting reduction is short over a function field: a finite-order character times c^{deg}. But it needs the
constant rank-one F-isocrystal on the other side and the slope shift by v_p(c). Nothing plans it.

## /2 (medium, missing): item 1's planned status. Confirmed.

RD.3 plans:
- frames;
- overconvergent isocrystals with Frobenius pullback isomorphisms;
- independence of embeddings;
- restriction to convergent isocrystals.

It does not plan Isoc(X) = Crys(X)[1/p], the equivalence with convergent F^n-isocrystals, or F^∞-Isoc(X) as a
2-colimit, and item 1's note admits this. Item 1 is in no route, so those parts are unrouted.

**The misprint.** p. 6 defines Φ^m := Φ ∘ F^*(Φ^{m−1}) for Φ : (F^n)^*M ≅ M. For n > 1 the types do not compose, so the
pullback must be (F^n)^*. This is not among E1–E14; record it as a new misprint.

## /3 (high, error): the base field of the monodromy groups. Confirmed.

The paper sets up three things:
- **The group (p. 6).** ω_η lands in Vec_{K(Ω)}, and G(M, η) is "the Tannaka group of ⟨M⟩ with respect to ω_η", a
  group over K(Ω).
- **The coefficient field (p. 7).** §3.1 sets K := K(k).
- **The lattice (Definition 3.1.2).** It requires V_M ⊗ K(Ω) = ω_η(M).

But it then prints two group identities with the wrong base field:
- **Proposition 3.3.2 (p. 10):** "G(M, η) ≃ G(M, V_M, η) ⊗_{Q_p^ur} K".
- **Corollary 4.3.6 (p. 19):** "G(M, η) = G(M†, η) ∩ G(M, Φ^∞_M, η) ⊗_{Q_p^ur} K".

The categorical equivalence in Proposition 3.3.2 is right with K(k). The group identities need K(Ω), because the fibre
functor is V_M ⊗ K(Ω).

Items 42 and 50 and route 6's layer (2) copy "⊗ K". E2 fixes only the dual fibre, and E8 repeats "⊗ K". Record a new
source issue for Proposition 3.3.2 and Corollary 4.3.6, and note the same correction on E8.

The repair is a change of base field and does not touch the argument. But items 42 and 50 as they stand compare groups
over different fields, and a blueprint must not build that.

## /4 (medium, duplicate): Crew's monodromy groups. Confirmed.

Route 6 says "No layer or proposal plans Crew's monodromy groups of F-isocrystals". But the accepted PAPER-ABE-18/25,
on route 1 (PadicDifferentialEquationsPartIIArithmeticDModules), defines π_1^isoc := Aut^⊗(ω_x̄) and W^isoc (Abe
§§2.4.17–2.4.20). Its note reads "Crew's monodromy groups in the Weil-group form Lafforgue uses", and that route's
brief lists "Weil groups of isocrystals".

The overlap is partial. D'Addezio also needs:
- the convergent groups;
- perfect points;
- K(Ω)-valued fibres.

So the fix is the coordination the finding asks for: a shared prefix with one owner and a comparison, not a merger.

## Corrections to the fixes

- **/2:** add the (F^n)^* misprint as a new sourceIssue (misprint, affects nothing).
- **/3:** add one new sourceIssue (error, affects a stated result) for Proposition 3.3.2 and Corollary 4.3.6, and
  append the K(Ω) correction to E8's note.
